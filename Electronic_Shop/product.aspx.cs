using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Electronic_Shop
{
    public partial class product : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["es"].ConnectionString;
        PagedDataSource pds = new PagedDataSource();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategories();
                BindProducts(1); // Show all products initially, page 1
            }
        }

        private void BindCategories()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter daCat = new SqlDataAdapter("SELECT CategoryID, CategoryName FROM Categorie", conn);
                DataTable dtCat = new DataTable();
                daCat.Fill(dtCat);

                ddlCategory.DataSource = dtCat;
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CategoryID";
                ddlCategory.DataBind();

                ddlCategory.Items.Insert(0, new ListItem("-- Select Category --", "0"));
                ddlSubcategory.Items.Clear();
                ddlSubcategory.Items.Insert(0, new ListItem("-- Select Subcategory --", "0"));
            }
        }

        private void BindProducts(int pageIndex)
        {
            DataTable dtProd = new DataTable();

            int categoryId = Convert.ToInt32(ddlCategory.SelectedValue);
            int subcategoryId = Convert.ToInt32(ddlSubcategory.SelectedValue);
            int priceFilter = Convert.ToInt32(ddlPrice.SelectedValue);
            int sortOption = Convert.ToInt32(ddlSort.SelectedValue);
            string search = txtSearch.Text.Trim();
            bool hasSearch = !string.IsNullOrEmpty(search);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter daProd;
                string sql = "";

                // Build SQL Query based on filters
                if (subcategoryId > 0)
                {
                    sql = "SELECT ProductID, ProductName, Price, ImageUrl FROM Products WHERE SubcategoryID=@SubID";

                    if (hasSearch)
                        sql += " AND ProductName LIKE @Search";

                    if (priceFilter > 0)
                    {
                        sql += GetPriceCondition(priceFilter);
                    }
                }
                else if (categoryId > 0)
                {
                    sql = @"SELECT p.ProductID, p.ProductName, p.Price, p.ImageUrl 
                           FROM Products p 
                           INNER JOIN Subcategories s ON p.SubcategoryID = s.SubcategoryID 
                           WHERE s.CategoryID=@CatID";

                    if (hasSearch)
                        sql += " AND p.ProductName LIKE @Search";

                    if (priceFilter > 0)
                    {
                        sql += GetPriceConditionForJoin(priceFilter);
                    }
                }
                else
                {
                    sql = "SELECT ProductID, ProductName, Price, ImageUrl FROM Products WHERE 1=1";

                    if (hasSearch)
                        sql += " AND ProductName LIKE @Search";

                    if (priceFilter > 0)
                    {
                        sql += GetPriceCondition(priceFilter);
                    }
                }

                // Add ORDER BY based on sort option
                sql += GetOrderByClause(sortOption, categoryId, subcategoryId);

                daProd = new SqlDataAdapter(sql, conn);

                if (subcategoryId > 0)
                {
                    daProd.SelectCommand.Parameters.AddWithValue("@SubID", subcategoryId);
                }
                else if (categoryId > 0)
                {
                    daProd.SelectCommand.Parameters.AddWithValue("@CatID", categoryId);
                }

                if (hasSearch)
                    daProd.SelectCommand.Parameters.AddWithValue("@Search", "%" + search + "%");

                daProd.Fill(dtProd);
            }

            // Update active filters display
            UpdateActiveFiltersDisplay(categoryId, subcategoryId, search, priceFilter, sortOption);

            // Pagination setup
            pds.DataSource = dtProd.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 8;
            pds.CurrentPageIndex = pageIndex - 1;

            rptProducts.DataSource = pds;
            rptProducts.DataBind();

            // Build pager
            int totalPages = pds.PageCount;
            DataTable dtPager = new DataTable();
            dtPager.Columns.Add("Text");
            dtPager.Columns.Add("Value");
            dtPager.Columns.Add("Selected");

            for (int i = 1; i <= totalPages; i++)
            {
                DataRow dr = dtPager.NewRow();
                dr["Text"] = i.ToString();
                dr["Value"] = i.ToString();
                dr["Selected"] = (i == pageIndex);
                dtPager.Rows.Add(dr);
            }

            rptPager.DataSource = dtPager;
            rptPager.DataBind();
        }

        private string GetPriceCondition(int priceFilter)
        {
            switch (priceFilter)
            {
                case 1: return " AND Price < 10000";
                case 2: return " AND Price >= 10000 AND Price <= 50000";
                case 3: return " AND Price > 50000 AND Price <= 100000";
                case 4: return " AND Price > 100000";
                default: return "";
            }
        }

        private string GetPriceConditionForJoin(int priceFilter)
        {
            switch (priceFilter)
            {
                case 1: return " AND p.Price < 10000";
                case 2: return " AND p.Price >= 10000 AND p.Price <= 50000";
                case 3: return " AND p.Price > 50000 AND p.Price <= 100000";
                case 4: return " AND p.Price > 100000";
                default: return "";
            }
        }

        private string GetOrderByClause(int sortOption, int categoryId, int subcategoryId)
        {
            string prefix = (categoryId > 0 && subcategoryId == 0) ? "p." : "";

            switch (sortOption)
            {
                case 1: return " ORDER BY " + prefix + "Price ASC";
                case 2: return " ORDER BY " + prefix + "Price DESC";
                case 3: return " ORDER BY " + prefix + "ProductName ASC";
                default: return " ORDER BY " + prefix + "ProductID DESC";
            }
        }

        private void UpdateActiveFiltersDisplay(int categoryId, int subcategoryId, string search, int priceFilter, int sortOption)
        {
            string filterHtml = "";
            bool hasAnyFilter = false;

            // Category chip
            if (categoryId > 0)
            {
                filterHtml += "<span class='filter-chip'>🏷️ " + ddlCategory.SelectedItem.Text +
                    " <span class='remove-filter' onclick=\"RemoveFilter('category')\">×</span></span>";
                hasAnyFilter = true;
            }

            // Subcategory chip
            if (subcategoryId > 0)
            {
                filterHtml += "<span class='filter-chip'>📁 " + ddlSubcategory.SelectedItem.Text +
                    " <span class='remove-filter' onclick=\"RemoveFilter('subcategory')\">×</span></span>";
                hasAnyFilter = true;
            }

            // Price Range chip
            if (priceFilter > 0)
            {
                string priceText = "";
                switch (priceFilter)
                {
                    case 1:
                        priceText = "Under ₹10K";
                        break;
                    case 2:
                        priceText = "₹10K-₹50K";
                        break;
                    case 3:
                        priceText = "₹50K-₹100K";
                        break;
                    case 4:
                        priceText = "Above ₹100K";
                        break;
                }
                filterHtml += "<span class='filter-chip'>💰 " + priceText +
                    " <span class='remove-filter' onclick=\"RemoveFilter('price')\">×</span></span>";
                hasAnyFilter = true;
            }

            // Search chip
            if (!string.IsNullOrEmpty(search))
            {
                filterHtml += "<span class='filter-chip'>🔍 \"" + System.Web.HttpUtility.HtmlEncode(search) +
                    "\" <span class='remove-filter' onclick=\"RemoveFilter('search')\">×</span></span>";
                hasAnyFilter = true;
            }

            // Sort chip (show if not default)
            if (sortOption > 0)
            {
                string sortText = "";
                switch (sortOption)
                {
                    case 1:
                        sortText = "Price ↑";
                        break;
                    case 2:
                        sortText = "Price ↓";
                        break;
                    case 3:
                        sortText = "A-Z";
                        break;
                }
                filterHtml += "<span class='filter-chip'>↑↓ " + sortText +
                    " <span class='remove-filter' onclick=\"RemoveFilter('sort')\">×</span></span>";
                hasAnyFilter = true;
            }

            lblActiveFilters.Text = filterHtml;

            if (hasAnyFilter)
            {
                activeFiltersDiv.Style.Add("display", "block");
            }
            else
            {
                activeFiltersDiv.Style.Add("display", "none");
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int categoryId = Convert.ToInt32(ddlCategory.SelectedValue);
            if (categoryId > 0)
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlDataAdapter daSub = new SqlDataAdapter(
                        "SELECT SubcategoryID, SubcategoryName FROM Subcategories WHERE CategoryID=@CatID", conn);
                    daSub.SelectCommand.Parameters.AddWithValue("@CatID", categoryId);
                    DataTable dtSub = new DataTable();
                    daSub.Fill(dtSub);

                    ddlSubcategory.DataSource = dtSub;
                    ddlSubcategory.DataTextField = "SubcategoryName";
                    ddlSubcategory.DataValueField = "SubcategoryID";
                    ddlSubcategory.DataBind();

                    ddlSubcategory.Items.Insert(0, new ListItem("-- Select Subcategory --", "0"));
                }
            }
            else
            {
                ddlSubcategory.Items.Clear();
                ddlSubcategory.Items.Insert(0, new ListItem("-- Select Subcategory --", "0"));
            }

            // Refresh products with pagination
            BindProducts(1);
        }

        protected void ddlSubcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts(1);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindProducts(1);
        }

        protected void ddlPrice_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts(1);
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts(1);
        }

        protected void btnClearAllFilters_Click(object sender, EventArgs e)
        {
            ddlCategory.SelectedValue = "0";
            ddlSubcategory.Items.Clear();
            ddlSubcategory.Items.Insert(0, new ListItem("-- Select Subcategory --", "0"));
            ddlPrice.SelectedValue = "0";
            ddlSort.SelectedValue = "0";
            txtSearch.Text = "";
            BindProducts(1);
        }

        protected void Page_Changed(object sender, EventArgs e)
        {
            int pageIndex = Convert.ToInt32((sender as LinkButton).CommandArgument);
            BindProducts(pageIndex);
        }
    }
}
