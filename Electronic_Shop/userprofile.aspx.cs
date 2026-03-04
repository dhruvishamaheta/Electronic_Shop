using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Electronic_Shop
{
    public partial class userprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] == null)
                {
                    Response.Redirect("Login.aspx"); // Redirect if user is not logged in
                }
                else
                {
                    LoadUserProfile();
                }
            }
        }

        private void LoadUserProfile()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            int userId = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM register WHERE user_id= @UserID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtnm.Text = reader["user_name"].ToString();
                            txtmobileno.Text = reader["mobile_no"].ToString();
                            txtemail.Text = reader["email_id"].ToString();
                        }
                    }

                    con.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            int userId = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE register SET user_name = @Name, mobile_no = @MobileNo, email_id = @Email WHERE user_id = @UserID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtnm.Text);
                    cmd.Parameters.AddWithValue("@MobileNo", txtmobileno.Text);
                    cmd.Parameters.AddWithValue("@Email", txtemail.Text);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Profile updated successfully!');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Failed to update profile.');</script>");
                    }
                }
            }
        
    }
    }
}