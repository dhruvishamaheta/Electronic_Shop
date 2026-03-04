using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace Electronic_Shop
{
    public partial class Register : Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "Passwords do not match!";
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string checkQuery = "SELECT COUNT(*) FROM register WHERE email_id = @Email";
                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                int userExists = (int)checkCmd.ExecuteScalar();

                if (userExists > 0)
                {
                    lblMessage.Text = "Email already registered. Try logging in.";
                    return;
                }

                string insertQuery = "INSERT INTO register (user_name, mobile_no, email_id, password) VALUES (@Name, @Mobile, @Email, @Password)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Registration successful! Redirecting to login...";
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblMessage.Text = "Error registering user. Try again.";
                }
            }
        }
    }
}
