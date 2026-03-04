<%@ Page Title="Shop" Language="C#" MasterPageFile="~/userside.Master" AutoEventWireup="true"
    CodeBehind="product.aspx.cs" Inherits="Electronic_Shop.product" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
            body {
                background: url('images/shop-bg.jpg') no-repeat center center fixed;
                background-size: cover;
                font-family: 'Segoe UI', sans-serif;
            }

            .shop-wrapper {
                padding: 30px 0;
            }

            .filter-bar {
                background: linear-gradient(135deg, rgba(255, 255, 255, 0.98), rgba(240, 255, 240, 0.95));
                padding: 35px 30px;
                margin-bottom: 35px;
                border-radius: 16px;
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1), inset 0 1px 0 rgba(255, 255, 255, 0.6);
                display: flex;
                justify-content: center;
                gap: 30px;
                flex-wrap: wrap;
                border: 1px solid rgba(34, 197, 94, 0.1);
            }

            @media (max-width: 1200px) {
                .filter-bar {
                    gap: 20px;
                    padding: 25px 20px;
                }
            }

            @media (max-width: 768px) {
                .filter-bar {
                    flex-direction: column;
                    gap: 15px;
                }
            }

            .filter-group {
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 10px;
                width: 200px;
                min-height: 80px;
                justify-content: flex-start;
            }

            .filter-group:nth-child(5) {
                width: 260px;
            }

            .filter-label {
                font-weight: 700;
                font-size: 14px;
                color: #1f2937;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .dropdown-colored {
                width: 100%;
                padding: 14px 20px;
                height: 48px;
                border-radius: 32px;
                border: 2px solid #e0e7ff;
                font-size: 15px;
                font-weight: 500;
                color: #1f2937;
                background: #fff;
                box-shadow: 0 4px 12px rgba(34, 197, 94, 0.08);
                transition: all 0.3s ease;
                box-sizing: border-box;
                display: flex;
                align-items: center;
            }

            .dropdown-colored:hover {
                border-color: #22c55e;
                box-shadow: 0 6px 20px rgba(34, 197, 94, 0.12);
            }

            .dropdown-colored:focus {
                outline: none;
                border-color: #16a34a;
                box-shadow: 0 0 0 4px rgba(34, 197, 94, 0.15), 0 4px 12px rgba(34, 197, 94, 0.2);
            }

            .products-container {
                background: rgba(255, 255, 255, 0.97);
                border-radius: 12px;
                padding: 20px;
                box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
            }

            .product-card {
                background: #fff;
                border: 1px solid #e5e7eb;
                border-radius: 12px;
                padding: 16px;
                margin-bottom: 24px;
                transition: transform 0.18s ease, box-shadow 0.18s ease;
                text-align: center;
            }

            .product-card:hover {
                transform: translateY(-4px);
                box-shadow: 0 10px 22px rgba(0, 0, 0, 0.10);
            }

            .product-thumbnail {
                width: 100%;
                height: 220px;
                object-fit: contain;
                border-radius: 10px;
                background-color: #fafafa;
            }

            .product-title {
                font-size: 17px;
                margin-top: 12px;
                font-weight: 600;
                color: #111827;
            }

            .product-price {
                color: #22c55e;
                font-weight: 700;
                font-size: 16px;
                margin-top: 6px;
            }

            /* Pagination styling */
            .pagination {
                display: flex;
                justify-content: center;
                margin-top: 25px;
                gap: 8px;
            }

            .pagination a,
            .pagination span {
                padding: 8px 14px;
                border-radius: 8px;
                border: 1px solid #d1d5db;
                background: #fff;
                color: #374151;
                font-size: 14px;
                text-decoration: none;
                transition: all 0.2s ease;
            }

            /* Search button styling */
            .search-button {
                padding: 0 32px;
                height: 48px;
                border-radius: 32px;
                font-weight: 700;
                font-size: 15px;
                color: #fff;
                border: 2px solid #1f2937;
                background: linear-gradient(135deg, #2d3436 0%, #1f2937 100%);
                box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
                transition: all 0.3s ease;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                white-space: nowrap;
                box-sizing: border-box;
            }

            .search-button::before {
                content: "🔍";
                margin-right: 8px;
                font-size: 16px;
            }

            .search-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.35);
                background: linear-gradient(135deg, #404854 0%, #2d3436 100%);
            }

            .search-button:active {
                transform: translateY(0);
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25);
            }

            /* Search container flex alignment */
            .search-container {
                display: flex;
                gap: 12px;
                width: 100%;
                align-items: stretch;
            }

            .search-container .dropdown-colored {
                flex: 1;
                height: 48px;
            }

            .dropdown-colored::placeholder {
                color: #9ca3af;
            }

            .pagination a:hover {
                background: #22c55e;
                color: #fff;
                border-color: #22c55e;
            }

            .pagination .active {
                background: #22c55e;
                color: #fff;
                border-color: #22c55e;
                font-weight: 600;
            }

            /* Active filters display */
            .active-filters {
                background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);
                padding: 18px 20px;
                margin-bottom: 20px;
                border-radius: 12px;
                border-left: 5px solid #10b981;
                display: none;
                font-size: 14px;
                color: #065f46;
                box-shadow: 0 4px 14px rgba(16, 185, 129, 0.12);
            }

            .active-filters.show {
                display: block;
            }

            .filter-chips {
                display: flex;
                gap: 15px;
                flex-wrap: wrap;
                margin-top: 12px;
                margin-bottom: 12px;
            }

            .filter-chip {
                display: inline-flex;
                align-items: center;
                gap: 12px;
                background: linear-gradient(135deg, #1f2937 0%, #059669 100%);
                color: white;
                padding: 8px 14px;
                border-radius: 25px;
                font-size: 15px;
                font-weight: 600;
                box-shadow: 0 2px 8px rgba(16, 185, 129, 0.25);
                transition: all 0.3s ease;
            }
            .filter-chip:not(:last-child) {
                margin-right: 15px;
            }


            .filter-chip:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(16, 185, 129, 0.4);
            }

            .filter-chip .remove-filter {
                cursor: pointer;
                font-weight: bold;
                opacity: 0.9;
                transition: all 0.2s;
                margin-left: 4px;
            }

            .filter-chip .remove-filter:hover {
                opacity: 1;
                transform: scale(1.2);
            }

            .clear-all-filters {
                display: inline-block;
                margin-top: 0px;
                margin-left: 6px;
                padding: 10px 20px 10px 10px;
                background: linear-gradient(135deg, #6c757d 0%, #6c757d 100%);
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 14px;
                font-weight: 700;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
            }

            .clear-all-filters:hover {
                background: linear-gradient(135deg, #6c757d 0%, #6c757d 100%);
                box-shadow: 0 6px 16px rgba(239, 68, 68, 0.4);
                transform: translateY(-2px);
            }

            .clear-all-filters:active {
                transform: translateY(0);
            }

            /* Price Filter Sidebar */
            .filter-sidebar {
                position: relative;
            }

            .sidebar-container {
                display: flex;
                gap: 20px;
            }

            .price-filter-panel {
                background: #fff;
                border-radius: 12px;
                padding: 20px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
                min-width: 250px;
                max-height: 600px;
                overflow-y: auto;
            }

            .price-filter-title {
                font-weight: 700;
                font-size: 16px;
                color: #1f2937;
                margin-bottom: 15px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .price-range-item {
                padding: 10px 0;
                border-bottom: 1px solid #f0f0f0;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .price-range-item:last-child {
                border-bottom: none;
            }

            .price-range-item input[type="radio"] {
                cursor: pointer;
                accent-color: #22c55e;
            }

            .price-range-item label {
                cursor: pointer;
                flex: 1;
                color: #374151;
                font-size: 14px;
                margin: 0;
            }

            .price-range-item label:hover {
                color: #22c55e;
            }

            .reset-price-link {
                color: #0ea5e9;
                font-size: 13px;
                text-decoration: none;
                margin-top: 10px;
                display: inline-block;
                font-weight: 600;
            }

            .products-grid {
                flex: 1;
            }
        </style>

        <script type="text/javascript">
            function RemoveFilter(filterType) {
                var ddlCategory = document.getElementById('<%= ddlCategory.ClientID %>');
                var ddlSubcategory = document.getElementById('<%= ddlSubcategory.ClientID %>');
                var ddlPrice = document.getElementById('<%= ddlPrice.ClientID %>');
                var ddlSort = document.getElementById('<%= ddlSort.ClientID %>');
                var txtSearch = document.getElementById('<%= txtSearch.ClientID %>');

                switch (filterType) {
                    case 'category':
                        ddlCategory.value = '0';
                        ddlSubcategory.innerHTML = '<option value="0">-- Select Subcategory --</option>';
                        break;
                    case 'subcategory':
                        ddlSubcategory.value = '0';
                        break;
                    case 'price':
                        ddlPrice.value = '0';
                        break;
                    case 'sort':
                        ddlSort.value = '0';
                        break;
                    case 'search':
                        txtSearch.value = '';
                        break;
                }

                // Trigger filter update
                var btnSearch = document.getElementById('<%= btnSearch.ClientID %>');
                btnSearch.click();
            }
        </script>
    </asp:Content>

    <asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
        <div class="shop-wrapper">
            <div class="container-fluid">

                <!-- Filter Bar -->
                <div class="filter-bar">
                    <div class="filter-group">
                        <span class="filter-label">🏷️ Category</span>
                        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" CssClass="dropdown-colored">
                        </asp:DropDownList>
                    </div>

                    <div class="filter-group">
                        <span class="filter-label">📁 Subcategory</span>
                        <asp:DropDownList ID="ddlSubcategory" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSubcategory_SelectedIndexChanged" CssClass="dropdown-colored">
                        </asp:DropDownList>
                    </div>

                    <div class="filter-group">
                        <span class="filter-label">💰 Price Range</span>
                        <asp:DropDownList ID="ddlPrice" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlPrice_SelectedIndexChanged" CssClass="dropdown-colored">
                            <asp:ListItem Value="0">All Prices</asp:ListItem>
                            <asp:ListItem Value="1">Under ₹10,000</asp:ListItem>
                            <asp:ListItem Value="2">₹10,000 - ₹50,000</asp:ListItem>
                            <asp:ListItem Value="3">₹50,000 - ₹100,000</asp:ListItem>
                            <asp:ListItem Value="4">Above ₹100,000</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="filter-group">
                        <span class="filter-label">↑↓ Sort By</span>
                        <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSort_SelectedIndexChanged" CssClass="dropdown-colored">
                            <asp:ListItem Value="0">Latest Products</asp:ListItem>
                            <asp:ListItem Value="1">Price: Low to High</asp:ListItem>
                            <asp:ListItem Value="2">Price: High to Low</asp:ListItem>
                            <asp:ListItem Value="3">Product Name: A-Z</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="filter-group">
                        <span class="filter-label">🔍 Search</span>
                        <div class="search-container">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="dropdown-colored"
                                placeholder="Search product"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="search-button"
                                OnClick="btnSearch_Click" />
                        </div>
                    </div>
                </div>

                <!-- Active Filters Display -->
                <div class="active-filters" id="activeFiltersDiv" runat="server">
                    <strong>🎯 Applied Filters:</strong>
                    <div class="filter-chips">
                        <asp:Label ID="lblActiveFilters" runat="server" Text=""></asp:Label>
                         <asp:Button ID="Button1" runat="server" Text="Clear All Filters"
     CssClass="clear-all-filters" OnClick="btnClearAllFilters_Click" />
                    </div>
                   
                </div>

                <!-- Product Cards -->
                <div class="products-container">
                    <div class="row">
                        <asp:Repeater ID="rptProducts" runat="server">
                            <ItemTemplate>
                                <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                                    <div class="product-card">
                                        <a href='ProductDetails.aspx?pid=<%# Eval("ProductID") %>'
                                            style="text-decoration: none; color: inherit;">
                                            <img src='<%# Eval("ImageURL") %>' class="product-thumbnail"
                                                alt='<%# Eval("ProductName") %>' />
                                            <h3 class="product-title">
                                                <%# Eval("ProductName") %>
                                            </h3>
                                        </a>
                                        <strong class="product-price">₹<%# Eval("Price") %></strong><div class="mt-3">
                                            <!-- Add to Cart -->
                                            <a class="btn btn-sm btn-outline-primary"
                                                href='AddToCart.aspx?productid=<%# Eval("ProductID") %>&price=<%# Eval("Price") %>&name=<%# HttpUtility.UrlEncode(Eval("ProductName").ToString()) %>&img=<%# HttpUtility.UrlEncode(Eval("ImageURL").ToString()) %>'>
                                                Add to Cart
                                            </a>

                                            <!-- Buy Now -->
                                            <a class="btn btn-sm btn-outline-success ms-2"
                                                href='order.aspx?productid=<%# Eval("ProductID") %>&price=<%# Eval("Price") %>'>
                                                Buy Now
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <!-- Pagination -->
                    <div class="pagination">
                        <asp:Repeater ID="rptPager" runat="server">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkPage" runat="server" Text='<%# Eval("Text") %>'
                                    CommandArgument='<%# Eval("Value") %>'
                                    CssClass='<%# Convert.ToBoolean(Eval("Selected")) ? "active" : "" %>'
                                    OnClick="Page_Changed">
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>