using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronic_Shop
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        string connStr
        {
            get { return ConfigurationManager.ConnectionStrings["es"].ConnectionString; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get product ID from query string
                string productIdStr = Request.QueryString["pid"];

                if (string.IsNullOrEmpty(productIdStr) || !int.TryParse(productIdStr, out int productId))
                {
                    ShowError("Invalid product ID. Please select a valid product.");
                    return;
                }

                // Load product details
                LoadProductDetails(productId);

                // Load related products (same category)
                LoadRelatedProducts(productId);
            }
        }

        private void LoadProductDetails(int productId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string sql = @"
                        SELECT 
                            p.ProductID, 
                            p.ProductName, 
                            p.Price, 
                            p.ImageUrl,
                            p.Quantity,
                            p.SubcategoryID,
                            s.SubcategoryName,
                            c.CategoryID,
                            c.CategoryName
                        FROM Products p
                        LEFT JOIN Subcategories s ON p.SubcategoryID = s.SubcategoryID
                        LEFT JOIN Categorie c ON s.CategoryID = c.CategoryID
                        WHERE p.ProductID = @ProductID";

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@ProductID", productId);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        string productName = reader["ProductName"].ToString();
                        decimal price = Convert.ToDecimal(reader["Price"]);
                        string imageUrl = reader["ImageUrl"].ToString();
                        int quantity = reader["Quantity"] != DBNull.Value ? Convert.ToInt32(reader["Quantity"]) : 0;
                        string description = "High-quality electronics product with premium features and specifications.";
                        string subcategoryName = reader["SubcategoryName"] != DBNull.Value ? reader["SubcategoryName"].ToString() : "N/A";
                        string categoryName = reader["CategoryName"] != DBNull.Value ? reader["CategoryName"].ToString() : "N/A";

                        // Set breadcrumb
                        breadcrumbProduct.InnerText = productName;

                        // Build product details HTML
                        string stockStatus = quantity > 0 ? "In Stock" : "Out of Stock";
                        string stockClass = quantity > 0 ? "#dcfce7" : "#fee2e2";

                        string html = $@"
                            <div class='product-detail-container'>
                                <div class='product-main-section'>
                                    <div class='product-image-section'>
                                        <img src='{imageUrl}' alt='{productName}' class='product-image' />
                                    </div>
                                    <div class='product-info-section'>
                                        <h1>{productName}</h1>
                                        
                                        <div class='product-price'>
                                            <span>₹{price:N2}</span>
                                            <span class='stock-badge' style='background: {stockClass}; color: {(quantity > 0 ? "#166534" : "#991b1b")};'>
                                                {stockStatus}
                                            </span>
                                        </div>

                                        <p class='product-description'>
                                            {description}
                                        </p>

                                        <div class='product-specifications'>
                                            <div class='spec-row'>
                                                <div class='spec-label'>Category:</div>
                                                <div class='spec-value'>{categoryName}</div>
                                            </div>
                                            <div class='spec-row'>
                                                <div class='spec-label'>Subcategory:</div>
                                                <div class='spec-value'>{subcategoryName}</div>
                                            </div>
                                            <div class='spec-row'>
                                                <div class='spec-label'>Available Quantity:</div>
                                                <div class='spec-value'>{quantity} units</div>
                                            </div>
                                        </div>

                                        <div class='action-buttons'>
                                            <a href='AddToCart.aspx?productid={productId}&price={price}&name={System.Web.HttpUtility.UrlEncode(productName)}&img={System.Web.HttpUtility.UrlEncode(imageUrl)}' 
                                               class='btn-primary'>🛒 Add to Cart</a>
                                            <a href='order.aspx?productid={productId}&price={price}' 
                                               class='btn-primary' style='background: linear-gradient(135deg, #0ea5e9 0%, #0284c7 100%);'>💳 Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>";

                        plhProductDetails.Controls.Add(new LiteralControl(html));
                    }
                    else
                    {
                        ShowError("Product not found. Please check the product ID.");
                    }

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                ShowError($"Error loading product details: {ex.Message}");
            }
        }

        private void LoadRelatedProducts(int productId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    // First, get the subcategory of the current product
                    string sqlGetSubcategory = "SELECT SubcategoryID FROM Products WHERE ProductID = @ProductID";
                    SqlCommand cmdGetSubcat = new SqlCommand(sqlGetSubcategory, conn);
                    cmdGetSubcat.Parameters.AddWithValue("@ProductID", productId);

                    conn.Open();
                    object subcategoryObj = cmdGetSubcat.ExecuteScalar();
                    conn.Close();

                    DataTable dt = new DataTable();

                    if (subcategoryObj != null && int.TryParse(subcategoryObj.ToString(), out int subcategoryId))
                    {
                        // Get other products from the same subcategory (excluding current product)
                        string sql = @"
                            SELECT 
                                ProductID, 
                                ProductName, 
                                Price, 
                                ImageUrl
                            FROM Products
                            WHERE SubcategoryID = @SubcategoryID 
                            AND ProductID != @ProductID
                            ORDER BY ProductID DESC";

                        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                        da.SelectCommand.Parameters.AddWithValue("@SubcategoryID", subcategoryId);
                        da.SelectCommand.Parameters.AddWithValue("@ProductID", productId);

                        da.Fill(dt);
                    }
                    else
                    {
                        // No subcategory found, show all other products
                        string sql = @"
                            SELECT 
                                ProductID, 
                                ProductName, 
                                Price, 
                                ImageUrl
                            FROM Products
                            WHERE ProductID != @ProductID
                            ORDER BY ProductID DESC";

                        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                        da.SelectCommand.Parameters.AddWithValue("@ProductID", productId);

                        da.Fill(dt);
                    }

                    // Bind repeater and show/hide no products message
                    if (dt.Rows.Count > 0)
                    {
                        rptRelatedProducts.DataSource = dt;
                        rptRelatedProducts.DataBind();
                        lblNoProducts.Visible = false;
                    }
                    else
                    {
                        lblNoProducts.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                // If error loading related products, just log it and continue
                System.Diagnostics.Debug.WriteLine($"Error loading related products: {ex.Message}");
                lblNoProducts.Visible = true;
            }
        }

        private void ShowError(string message)
        {
            errorDiv.Style.Add("display", "block");
            lblError.Text = message;
        }
    }
}
