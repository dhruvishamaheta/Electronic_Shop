using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;


namespace Electronic_Shop
{
    public partial class contact : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Session["UserID"] != null)
            {
                int userId = Convert.ToInt32(Session["UserID"]);

                // Get values from input fields
                string name = txtnm.Text.Trim();
            string email = txtemail.Text.Trim();
            string subject = txtsub.Text.Trim();
            string message = txtmsg.Text.Trim();

            // Validate if required fields are not empty
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(message))
            {
                Label1.Text = "Please fill in all required fields.";
                return;
            }

            // Database connection string
            string connStr = ConfigurationManager.ConnectionStrings["es"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Contact (UserId,Name, Email, Subject, Message) VALUES (@UserId,@Name, @Email, @Subject, @Message)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                        // Add parameters to prevent SQL injection
                        cmd.Parameters.AddWithValue("@UserId", userId);

                        cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Subject", subject);
                    cmd.Parameters.AddWithValue("@Message", message);

                    try
                    {
                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Label1.Text = "Your message has been sent successfully!";
                            // Clear fields after successful submission
                            txtnm.Text = "";
                            txtemail.Text = "";
                            txtsub.Text = "";
                            txtmsg.Text = "";
                        }
                        else
                        {
                            Label1.Text = "Error sending message. Please try again.";
                        }
                    }
                    catch (Exception ex)
                    {
                        Label1.Text = "Database error: " + ex.Message;
                    }
                }
            }
            }
            else
            {
                Label1.Text = "Login First to Send Message";
            }
        }
    }
}