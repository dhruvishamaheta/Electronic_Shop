using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Electronic_Shop
{
    public partial class Admin_Contact : System.Web.UI.Page
    {
        // Connection string is readonly since it never changes
        readonly string s = ConfigurationManager.ConnectionStrings["es"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid();
            }
        }

        // Method name corrected to PascalCase
        void FillGrid()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Contact", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
    }
}
