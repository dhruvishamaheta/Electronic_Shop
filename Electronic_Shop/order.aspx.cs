using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Electronic_Shop
{
    public partial class order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                    return;
                }

                if (Request.QueryString["productid"] != null && Request.QueryString["price"] != null)
                {
                    hfProductID.Value = Request.QueryString["productid"];
                    hfPrice.Value = Request.QueryString["price"];
                }
                else
                {
                    Response.Write("<script>alert('Product info missing');</script>");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string firstName = fname.Text.Trim();
            string addressText = address.Text.Trim();
            string emailText = email.Text.Trim();
            string mobile = mobileNumber.Text.Trim();

            if (!int.TryParse(quantity.Text.Trim(), out int qty))
            {
                Response.Write("<script>alert('Invalid quantity');</script>");
                return;
            }

            if (!decimal.TryParse(hfPrice.Value, out decimal price))
            {
                Response.Write("<script>alert('Invalid price');</script>");
                return;
            }

            if (Session["UserID"] == null)
            {
                Response.Write("<script>alert('Session expired. Please log in again.');</script>");
                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);
            int productId = Convert.ToInt32(hfProductID.Value);
            decimal totalAmount = qty * price;

            string connectionString = ConfigurationManager.ConnectionStrings["es"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(
                @"INSERT INTO Orders 
                  (UserID, ProductID, OrderDate, TotalAmount, Status, FirstName, Address, Email, MobileNumber, Quantity) 
                  VALUES 
                  (@UserID, @ProductID, GETDATE(), @TotalAmount, 'Pending', @FirstName, @Address, @Email, @MobileNumber, @Quantity)", con))
            {
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@ProductID", productId);
                cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@Address", addressText);
                cmd.Parameters.AddWithValue("@Email", emailText);
                cmd.Parameters.AddWithValue("@MobileNumber", mobile);
                cmd.Parameters.AddWithValue("@Quantity", qty);

                try
                {
                    con.Open();
                    int rows = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rows > 0)
                    {
                        Response.Redirect("~/orderconfirmation.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {
                        Response.Write("<script>alert('Insert failed.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Insert error: " + ex.Message + "');</script>");
                }
            }
        }
    }
}
