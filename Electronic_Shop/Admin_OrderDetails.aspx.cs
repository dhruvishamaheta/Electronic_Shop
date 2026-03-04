using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Electronic_Shop
{
    public partial class Admin_OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["__EVENTTARGET"] == "UpdateOrderStatus" && int.TryParse(Request["__EVENTARGUMENT"], out int orderId))
            {
                Response.Write("<script>alert('Attempting to update order status...');</script>");
                UpdateOrderStatus(orderId, "Confirmed"); // Provide the missing 'status' parameter

                LoadOrders(); // Refresh GridView
            }

            if (!IsPostBack)
            {
                LoadOrders();
            }
        }
        private void LoadOrders()
        {
            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT OrderID, UserID, OrderDate, TotalAmount, Status FROM Orders";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvOrders.DataSource = dt;
                gvOrders.DataBind();
            }
        }

        protected void gvOrders_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvOrders_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void gvOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int orderId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "ViewOrder")
            {
                // ✅ Update status when clicking "ViewOrder"
                UpdateOrderStatus(orderId);
            }
            else if (e.CommandName == "ConfirmOrder")
            {
                UpdateOrderStatus(orderId, "Confirmed");
            }
            else if (e.CommandName == "DeleteOrder")
            {
                DeleteOrder(orderId);
            }
        }

        private void UpdateOrderStatus(int orderId)
        {
            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // Update order status only if it's 'Pending'
                string query = "UPDATE Orders SET Status = 'Completed' WHERE OrderID = @OrderID AND Status = 'Pending'";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@OrderID", orderId);
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Order status updated successfully!');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Order is already Completed or not found!');</script>");
                    }
                }
            }

            LoadOrders();
        }

        private void ShowOrderDetails(int orderId)
        {
            string script = $@"if (confirm('Do you want to update the status to Confirmed?')) 
                       __doPostBack('UpdateOrderStatus', '{orderId}');";

            ScriptManager.RegisterStartupScript(this, GetType(), "confirmOrder", script, true);
        }


        // Delete order and related records
        private void DeleteOrder(int orderId)
        {
            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // Delete related records in child tables first
                string deleteOrderDetailsQuery = "DELETE FROM OrderDetails WHERE OrderID = @OrderID";
                string deleteOrderQuery = "DELETE FROM Orders WHERE OrderID = @OrderID";

                using (SqlCommand cmd = new SqlCommand(deleteOrderDetailsQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@OrderID", orderId);
                    cmd.ExecuteNonQuery();
                }

                using (SqlCommand cmd = new SqlCommand(deleteOrderQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@OrderID", orderId);
                    cmd.ExecuteNonQuery();
                }
            }

            LoadOrders(); // Refresh the grid
        
    }

        // Update order status to "Confirmed" if confirmed through alert
        protected void Page_PreRender(object sender, EventArgs e)
        {
            string confirmOrderID = Request.QueryString["confirmOrderID"];

            if (!string.IsNullOrEmpty(confirmOrderID))
            {
                int orderId;
                if (int.TryParse(confirmOrderID, out orderId))
                {
                    UpdateOrderStatus(orderId, "Confirmed");
                    LoadOrders(); // Refresh GridView
                }
            }
        }
        private void UpdateOrderStatus(int orderId, string status)
        {
            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                string query = "UPDATE Orders SET Status = @Status WHERE OrderID = @OrderID AND Status = 'Pending'";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@OrderID", orderId);
                    cmd.Parameters.AddWithValue("@Status", status);
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Order status updated successfully!');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Order is already Completed or not found!');</script>");
                    }
                }
            }

            LoadOrders();
        }

        // Method to update order status


    }
}