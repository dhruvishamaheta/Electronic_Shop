using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using Electronic_Shop.Models;

namespace Electronic_Shop
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtPassword.Attributes["type"] = "password";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT user_id, user_name FROM register WHERE email_id = @Email AND password = @Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    int userId = Convert.ToInt32(reader["user_id"]);
                    string userName = reader["user_name"].ToString();

                    Session["UserID"] = userId;
                    Session["UserName"] = userName;

                    Session["Cart"] = LoadCartFromDatabase(userId);

                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }

                reader.Close();
            }
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
    }
}
