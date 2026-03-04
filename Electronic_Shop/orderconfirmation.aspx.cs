using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Electronic_Shop
{
    public partial class orderconfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                string cs = ConfigurationManager.ConnectionStrings["es"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // ✅ Get latest order for this user
                    using (SqlCommand cmd = new SqlCommand(
                        "SELECT TOP 1 * FROM Orders WHERE UserID = @UserID ORDER BY OrderDate DESC", con))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userId);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                lblName.Text = reader["FirstName"].ToString();
                                lblAddress.Text = reader["Address"].ToString();
                                lblEmail.Text = reader["Email"].ToString();
                                lblMobile.Text = reader["MobileNumber"].ToString();
                                lblProductID.Text = reader["ProductID"].ToString();

                                int qty = Convert.ToInt32(reader["Quantity"]);
                                decimal total = Convert.ToDecimal(reader["TotalAmount"]);
                                decimal unitPrice = qty > 0 ? Math.Round(total / qty, 2) : total;

                                lblQuantity.Text = qty.ToString();
                                lblPrice.Text = "₹" + unitPrice.ToString("0.00");
                                lblTotal.Text = "₹" + total.ToString("0.00");
                                lblDate.Text = Convert.ToDateTime(reader["OrderDate"]).ToString("dd-MM-yyyy hh:mm tt");
                                lblStatus.Text = reader["Status"].ToString();

                                // ✅ Load product image
                                int productId = Convert.ToInt32(reader["ProductID"]);
                                reader.Close(); // Close before new query

                                using (SqlCommand imgCmd = new SqlCommand(
                                    "SELECT ImageURL FROM Products WHERE ProductID = @ProductID", con))
                                {
                                    imgCmd.Parameters.AddWithValue("@ProductID", productId);
                                    using (SqlDataReader imgReader = imgCmd.ExecuteReader())
                                    {
                                        if (imgReader.Read())
                                        {
                                            string imageUrl = imgReader["ImageURL"].ToString();
                                            imgProduct.ImageUrl = imageUrl;
                                        }
                                    }
                                }
                            }
                            else
                            {
                                lblName.Text = "No order found.";
                            }
                        }
                    }

                    con.Close();
                }
            }
        }
    }
}
