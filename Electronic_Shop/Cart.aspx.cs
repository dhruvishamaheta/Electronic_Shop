using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using Electronic_Shop.Models;

namespace Electronic_Shop
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["remove"] != null)
                {
                    int removeId;
                    if (int.TryParse(Request.QueryString["remove"], out removeId))
                    {
                        var cartList = Session["Cart"] as List<CartItem>;
                        if (cartList != null)
                        {
                            cartList.RemoveAll(c => c.ProductID == removeId);
                            Session["Cart"] = cartList;
                        }

                        if (Session["UserID"] != null)
                        {
                            int userId = Convert.ToInt32(Session["UserID"]);
                            RemoveCartItemFromDatabase(userId, removeId);
                        }

                        Response.Redirect("Cart.aspx");
                        return;
                    }
                }

                RenderCart();
            }
        }

        private void RenderCart()
        {
            List<CartItem> cartList;

            if (Session["UserID"] != null)
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                cartList = LoadCartFromDatabase(userId);
                Session["Cart"] = cartList;
            }
            else
            {
                cartList = Session["Cart"] as List<CartItem>;
            }

            if (cartList == null || cartList.Count == 0)
            {
                pnlCart.Controls.Add(new LiteralControl("<p>Your cart is empty.</p>"));
                return;
            }

            var sb = new StringBuilder();
            sb.Append("<table class='table table-striped'>");
            sb.Append("<thead><tr><th></th><th>Product</th><th>Price</th><th>Qty</th><th>Subtotal</th><th></th></tr></thead><tbody>");

            decimal grandTotal = 0m;
            foreach (var item in cartList)
            {
                decimal subtotal = item.Price * item.Quantity;
                grandTotal += subtotal;

                sb.Append("<tr>");
                sb.AppendFormat("<td><img src='{0}' style='max-width:80px;'/></td>", item.ImageURL);
                sb.AppendFormat("<td>{0}</td>", System.Web.HttpUtility.HtmlEncode(item.ProductName));
                sb.AppendFormat("<td>₹{0:N2}</td>", item.Price);
                sb.AppendFormat("<td>{0}</td>", item.Quantity);
                sb.AppendFormat("<td>₹{0:N2}</td>", subtotal);
                sb.AppendFormat("<td><a class='btn btn-sm btn-danger' href='cart.aspx?remove={0}'>Remove</a> " +
                                "<a class='btn btn-sm btn-primary' href='order.aspx?productid={0}&price={1}'>Order</a></td>",
                                item.ProductID, item.Price);
                sb.Append("</tr>");
            }

            sb.Append("</tbody>");
            sb.AppendFormat("<tfoot><tr><td colspan='4' class='text-end'><strong>Total:</strong></td>" +
                            "<td colspan='2'><strong>₹{0:N2}</strong></td></tr></tfoot>", grandTotal);
            sb.Append("</table>");

            pnlCart.Controls.Add(new LiteralControl(sb.ToString()));
        }

        private List<CartItem> LoadCartFromDatabase(int userId)
        {
            var cart = new List<CartItem>();
            string connStr = ConfigurationManager.ConnectionStrings["es"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT ProductID, ProductName, Price, Quantity, ImageURL FROM CartItems WHERE UserID = @UserID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            cart.Add(new CartItem
                            {
                                ProductID = Convert.ToInt32(reader["ProductID"]),
                                ProductName = reader["ProductName"].ToString(),
                                Price = Convert.ToDecimal(reader["Price"]),
                                Quantity = Convert.ToInt32(reader["Quantity"]),
                                ImageURL = reader["ImageURL"].ToString()
                            });
                        }
                    }
                }
            }
            return cart;
        }

        private void RemoveCartItemFromDatabase(int userId, int productId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "DELETE FROM CartItems WHERE UserID = @UserID AND ProductID = @ProductID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
