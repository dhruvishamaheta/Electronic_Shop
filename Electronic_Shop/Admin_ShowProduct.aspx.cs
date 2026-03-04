using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Electronic_Shop
{
    public partial class Admin_ShowProduct : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["es"].ToString();


        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT ProductID, ProductName, Price, Quantity FROM Products";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void gvProducts_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            getcon();
            if (e.CommandArgument != null)
            {
                // Get the ProductID from CommandArgument
                int productId = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName == "Edit")
                {
                    // Redirect to the AddProduct page with ProductID for editing
                    Response.Redirect($"Admin_AddProduct.aspx?product_id={productId}");
                }
                // Delete is handled in RowDeleting to ensure DataKeys and proper transactional deletion
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get the ProductID of the row being deleted
            int productId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            // Open the connection
            getcon();

            try
            {
                // Check if there are OrderDetails referencing this product
                using (SqlCommand cmdCheck = new SqlCommand("SELECT COUNT(*) FROM OrderDetails WHERE ProductID = @ProductID", con))
                {
                    cmdCheck.Parameters.AddWithValue("@ProductID", productId);
                    int refCount = Convert.ToInt32(cmdCheck.ExecuteScalar());
                    if (refCount > 0)
                    {
                        // Prevent deletion to preserve order history
                        Response.Write("<script>alert('Cannot delete product: it has existing order records.');</script>");
                        return;
                    }
                }

                // No referencing rows found — safe to delete the product
                using (SqlCommand cmdDelProduct = new SqlCommand("DELETE FROM Products WHERE ProductID = @ProductID", con))
                {
                    cmdDelProduct.Parameters.AddWithValue("@ProductID", productId);
                    int rows = cmdDelProduct.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        LoadProducts();
                        Response.Write("<script>alert('Product deleted successfully.');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Product not found or already deleted.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
            finally
            {
                if (con != null && con.State == ConnectionState.Open)
                    con.Close();
            }
        }
    }
}