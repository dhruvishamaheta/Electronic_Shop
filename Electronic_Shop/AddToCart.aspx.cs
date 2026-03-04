using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using Electronic_Shop.Models;

namespace Electronic_Shop
{
    public partial class AddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int productId;
            if (!int.TryParse(Request.QueryString["productid"], out productId))
            {
                Response.Redirect("product.aspx");
                return;
            }

            string name = Request.QueryString["name"] ?? string.Empty;
            string img = Request.QueryString["img"] ?? string.Empty;

            // ✅ Always parse price safely
            decimal price = 0m;
            decimal.TryParse(Request.QueryString["price"], out price);

            // ✅ Update session cart
            var cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
            var existing = cart.Find(c => c.ProductID == productId);
            if (existing != null)
            {
                existing.Quantity += 1;
            }
            else
            {
                cart.Add(new CartItem
                {
                    ProductID = productId,
                    ProductName = name,
                    Price = price,
                    Quantity = 1,
                    ImageURL = img
                });
            }
            Session["Cart"] = cart;

            // ✅ Database update only if user logged in
            if (Session["UserID"] != null)
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                SaveCartItemToDatabase(userId, productId, name, price, img);
            }

            Response.Redirect("Cart.aspx");
        }

        private void SaveCartItemToDatabase(int userId, int productId, string name, decimal price, string img)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    string query = @"
                        IF EXISTS (SELECT 1 FROM CartItems WHERE UserID = @UserID AND ProductID = @ProductID)
                        BEGIN
                            UPDATE CartItems 
                            SET Quantity = Quantity + 1, UpdatedAt = GETDATE()
                            WHERE UserID = @UserID AND ProductID = @ProductID
                        END
                        ELSE
                        BEGIN
                            INSERT INTO CartItems (UserID, ProductID, ProductName, Price, Quantity, ImageURL, UpdatedAt)
                            VALUES (@UserID, @ProductID, @ProductName, @Price, 1, @ImageURL, GETDATE())
                        END";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userId);
                        cmd.Parameters.AddWithValue("@ProductID", productId);
                        cmd.Parameters.AddWithValue("@ProductName", name);
                        cmd.Parameters.AddWithValue("@Price", price);
                        cmd.Parameters.AddWithValue("@ImageURL", img ?? (object)DBNull.Value);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                // ✅ Show error if insert fails
                Response.Write("DB Error: " + ex.Message);
            }
        }
    }
}
