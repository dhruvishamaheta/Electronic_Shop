using Electronic_Shop.Models;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace Electronic_Shop
{
    public partial class userside : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetActiveNavItem();

                if (litUserOptions != null)
                {
                    LoadUserOptions();
                }
            }
        }

        private void SetActiveNavItem()
        {
            string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath).ToLower();

            liHome.Attributes.Remove("class");
            liShop.Attributes.Remove("class");
            liAbout.Attributes.Remove("class");
            liService.Attributes.Remove("class");
            liContact.Attributes.Remove("class");

            switch (currentPage)
            {
                case "dashboard.aspx":
                    liHome.Attributes["class"] = "nav-item active";
                    break;
                case "product.aspx":
                    liShop.Attributes["class"] = "nav-item active";
                    break;
                case "about.aspx":
                    liAbout.Attributes["class"] = "nav-item active";
                    break;
                case "service.aspx":
                    liService.Attributes["class"] = "nav-item active";
                    break;
                case "contact.aspx":
                    liContact.Attributes["class"] = "nav-item active";
                    break;
            }
        }

        private void LoadUserOptions()
        {
            string cartUrl = ResolveUrl("~/cart.aspx");

            if (Session["UserID"] != null && Session["UserName"] != null)
            {
                string userName = Session["UserName"].ToString();

                string profileUrl = ResolveUrl("~/userprofile.aspx");
                string ordersUrl = ResolveUrl("~/orderhistory.aspx");
                string logoutUrl = ResolveUrl("~/Logout.aspx");

                litUserOptions.Text = $@"
                    <div class='d-flex align-items-center gap-3'>
                        <div class='dropdown'>
                            <button class='btn btn-secondary dropdown-toggle' type='button' id='dropdownMenuButton' data-bs-toggle='dropdown' aria-expanded='false'>
                                {userName}
                            </button>
                            <ul class='dropdown-menu' aria-labelledby='dropdownMenuButton'>
                                <li><a class='dropdown-item' href='{profileUrl}'>Profile</a></li>
                                <li><a class='dropdown-item' href='{ordersUrl}'>My Order History</a></li>
                                <li><a class='dropdown-item' href='{logoutUrl}'>Logout</a></li>
                            </ul>
                        </div>
                        <!-- ✅ Cart Icon with Redirect -->
                        <a href='{cartUrl}' class='btn btn-outline-light position-relative'>
                            <i class='fas fa-shopping-cart'></i>
                            <span class='ms-1'>Cart</span>
                            <span class='position-absolute top-0 start-100 translate-middle badge rounded-pill bg-warning text-dark'>
                                {GetCartCount()}
                            </span>
                        </a>
                    </div>";
            }
            else
            {
                string loginUrl = ResolveUrl("~/Login.aspx");
                litUserOptions.Text = $"<a href='{loginUrl}' class='btn btn-primary'>Login</a>";
            }
        }

        private int GetCartCount()
        {
            var cartList = Session["Cart"] as List<CartItem>;
            if (cartList != null)
            {
                int totalQty = 0;
                foreach (var item in cartList)
                {
                    totalQty += item.Quantity;
                }
                return totalQty;
            }
            return 0;
        }
    }
}
