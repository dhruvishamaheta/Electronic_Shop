using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronic_Shop
{
    public partial class Admin_UserDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT user_id AS UserID, user_name AS Username, email_id AS Email, mobile_no AS PhoneNumber FROM register";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int userId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "DeleteUser")
            {
                DeleteUser(userId);
            }
        }

        private void DeleteUser(int userId)
        {
            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // Check for existing orders referencing this user to avoid FK violation
                using (SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Orders WHERE UserID = @UserID", conn))
                {
                    checkCmd.Parameters.AddWithValue("@UserID", userId);
                    int orderCount = Convert.ToInt32(checkCmd.ExecuteScalar());

                    if (orderCount > 0)
                    {
                        // Do not delete user if there are related orders. Inform admin.
                        Response.Write("<script>alert('Cannot delete user: there are existing orders for this user. Remove or reassign orders first.');</script>");
                        return;
                    }
                }
                string deleteQuery = "DELETE FROM register WHERE user_id = @UserID";
                using (SqlCommand cmd = new SqlCommand(deleteQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.ExecuteNonQuery();
                }
            }
            LoadUsers(); // Refresh the grid
        }
    }
}
