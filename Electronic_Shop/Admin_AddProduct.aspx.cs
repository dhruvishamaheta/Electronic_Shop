using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Electronic_Shop
{
    public partial class Admin_AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["product_id"] != null)
                {
                    int productId = Convert.ToInt32(Request.QueryString["product_id"]);
                    LoadProductDetails(productId);
                    btnAddProduct.Text = "Update Product";
                }
                else
                {
                    btnAddProduct.Text = "Add Product";
                }
            }
        }

        private void LoadProductDetails(int productId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT ProductName, Price, Quantity, ImageUrl, CategoryID, SubcategoryID
                                 FROM Products WHERE ProductID = @ProductID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtProductName.Text = reader["ProductName"].ToString();
                        txtPrice.Text = reader["Price"].ToString();
                        txtQuantity.Text = reader["Quantity"].ToString();
                        txtImageUrl.Text = reader["ImageUrl"].ToString();
                        txtCategorie.Text = reader["CategoryID"].ToString();
                        txtSubcategories.Text = reader["SubcategoryID"].ToString();
                    }
                }
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                if (Request.QueryString["product_id"] != null)
                {
                    int productId = Convert.ToInt32(Request.QueryString["product_id"]);
                    cmd.CommandText = @"UPDATE Products
                                        SET ProductName = @ProductName,
                                            Price = @Price,
                                            Quantity = @Quantity,
                                            ImageUrl = @ImageUrl,
                                            CategoryID = @CategoryID,
                                            SubcategoryID = @SubcategoryID
                                        WHERE ProductID = @ProductID";
                    cmd.Parameters.AddWithValue("@ProductID", productId);
                }
                else
                {
                    cmd.CommandText = @"INSERT INTO Products
                                        (ProductName, Price, Quantity, ImageUrl, CategoryID, SubcategoryID)
                                        VALUES (@ProductName, @Price, @Quantity, @ImageUrl, @CategoryID, @SubcategoryID)";
                }

                cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text);
                cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text));
                cmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(txtQuantity.Text));
                cmd.Parameters.AddWithValue("@ImageUrl", txtImageUrl.Text);
                cmd.Parameters.AddWithValue("@CategoryID", Convert.ToInt32(txtCategorie.Text));
                cmd.Parameters.AddWithValue("@SubcategoryID", Convert.ToInt32(txtSubcategories.Text));

                cmd.ExecuteNonQuery();

                string message = Request.QueryString["product_id"] != null ? "Product updated successfully!" : "Product added successfully!";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);
                Response.Redirect("Admin_ShowProduct.aspx");
            }
        }
    }
}
