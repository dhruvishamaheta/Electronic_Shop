using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronic_Shop
{
    public partial class Admin_AddCategory : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                LoadSubcategories();
                BindCategoryDropdown();
            }
        }

        // Add new category
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string query = "INSERT INTO Categorie (CategoryName) VALUES (@CategoryName)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CategoryName", txtCategoryName.Text.Trim());
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Write("<script>alert('Category added successfully!');</script>");
            txtCategoryName.Text = "";
            LoadCategories();
            BindCategoryDropdown();
        }

        // Add new subcategory
        protected void btnAddSubcategory_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string query = "INSERT INTO Subcategories (SubcategoryName, CategoryID) VALUES (@SubcategoryName, @CategoryID)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@SubcategoryName", txtSubcategoryName.Text.Trim());
                    cmd.Parameters.AddWithValue("@CategoryID", ddlCategories.SelectedValue);
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Write("<script>alert('Subcategory added successfully!');</script>");
            txtSubcategoryName.Text = "";
            LoadSubcategories();
        }

        // Load categories into GridView
        private void LoadCategories()
        {
            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string query = "SELECT CategoryID, CategoryName FROM Categorie";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    gvCategories.DataSource = reader;
                    gvCategories.DataBind();
                }
            }
        }

        // Load subcategories into GridView
        private void LoadSubcategories()
        {
            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string query = @"SELECT s.SubcategoryID, s.SubcategoryName, c.CategoryName 
                                 FROM Subcategories s 
                                 INNER JOIN Categorie c ON s.CategoryID = c.CategoryID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    gvSubcategories.DataSource = reader;
                    gvSubcategories.DataBind();
                }
            }
        }

        // Bind categories to dropdown for subcategory form
        private void BindCategoryDropdown()
        {
            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string query = "SELECT CategoryID, CategoryName FROM Categorie";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlCategories.DataSource = reader;
                    ddlCategories.DataTextField = "CategoryName";
                    ddlCategories.DataValueField = "CategoryID";
                    ddlCategories.DataBind();
                }
            }
        }

        // Delete category from GridView
        protected void gvCategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int categoryId = Convert.ToInt32(gvCategories.DataKeys[e.RowIndex].Value);

            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string query = "DELETE FROM Categorie WHERE CategoryID = @CategoryID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CategoryID", categoryId);
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Write("<script>alert('Category deleted successfully!');</script>");
            LoadCategories();
            BindCategoryDropdown();
            LoadSubcategories();
        }

        // Delete subcategory from GridView
        protected void gvSubcategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int subcategoryId = Convert.ToInt32(gvSubcategories.DataKeys[e.RowIndex].Value);

            string connString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string query = "DELETE FROM Subcategories WHERE SubcategoryID = @SubcategoryID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@SubcategoryID", subcategoryId);
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Write("<script>alert('Subcategory deleted successfully!');</script>");
            LoadSubcategories();
        }
    }
}
