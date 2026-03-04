using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Electronic_Shop
{
    public partial class orderhistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    LoadOrderHistory();
                }
            }
        }

        private void LoadOrderHistory()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            int userId = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        o.OrderID,
                        o.ProductID,
                        p.ProductName,
                        o.Quantity,
                        p.Price,
                        o.TotalAmount,
                        o.OrderDate,
                        o.Status,
                        p.ImageURL
                    FROM Orders o
                    INNER JOIN Products p ON o.ProductID = p.ProductID
                    WHERE o.UserID = @UserID
                    ORDER BY o.OrderDate DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    rptOrderHistory.DataSource = dt;
                    rptOrderHistory.DataBind();
                }
            }
        }

        protected string GetStatusClass(string status)
        {
            switch (status.ToLower())
            {
                case "pending": return "status-pending";
                case "confirmed": return "status-completed";
                case "cancelled": return "status-cancelled";
                default: return "";
            }
        }
    }
}
