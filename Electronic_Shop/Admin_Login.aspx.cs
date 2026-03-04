using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace Electronic_Shop
{
    public partial class Admin_Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtPassword.Attributes["type"] = "password"; // Hide password initially
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();
                string query = "SELECT COUNT(*) FROM admin WHERE username=@username AND password=@password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    Session["Admin"] = username;
                    Response.Redirect("Admin_Dashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid Username or Password";
                }
            }
        }
    }
}
