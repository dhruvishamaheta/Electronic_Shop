<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/userside.Master" AutoEventWireup="true"
    CodeBehind="ProductDetails.aspx.cs" Inherits="Electronic_Shop.ProductDetails" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
            body {
                background: url('images/shop-bg.jpg') no-repeat center center fixed;
                background-size: cover;
                font-family: 'Segoe UI', sans-serif;
            }

            .product-details-wrapper {
                padding: 40px 0;
            }

            .product-detail-container {
                background: rgba(255, 255, 255, 0.98);
                border-radius: 16px;
                padding: 40px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
                margin-bottom: 50px;
            }

            .product-main-section {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 40px;
                align-items: start;
            }

            @media (max-width: 768px) {
                .product-main-section {
                    grid-template-columns: 1fr;
                    gap: 30px;
                }
            }

            .product-image-section {
                display: flex;
                align-items: center;
                justify-content: center;
                background: #f8f9fa;
                border-radius: 12px;
                padding: 30px;
                min-height: 400px;
            }

            .product-image {
                max-width: 100%;
                max-height: 400px;
                object-fit: contain;
            }

            .product-info-section h1 {
                font-size: 32px;
                font-weight: 700;
                color: #1f2937;
                margin-bottom: 15px;
                line-height: 1.2;
            }

            .product-rating {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 20px;
                font-size: 14px;
                color: #6b7280;
            }

            .product-price {
                font-size: 28px;
                font-weight: 700;
                color: #22c55e;
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                gap: 15px;
            }

            .stock-badge {
                display: inline-block;
                padding: 8px 16px;
                background: #dcfce7;
                color: #166534;
                border-radius: 8px;
                font-size: 13px;
                font-weight: 600;
            }

            .product-description {
                color: #4b5563;
                line-height: 1.8;
                margin-bottom: 25px;
                font-size: 15px;
            }

            .product-specifications {
                background: #f9fafb;
                border-radius: 12px;
                padding: 20px;
                margin-bottom: 25px;
            }

            .spec-row {
                display: grid;
                grid-template-columns: 200px 1fr;
                gap: 20px;
                padding: 12px 0;
                border-bottom: 1px solid #e5e7eb;
            }

            .spec-row:last-child {
                border-bottom: none;
            }

            .spec-label {
                font-weight: 600;
                color: #1f2937;
                font-size: 14px;
            }

            .spec-value {
                color: #6b7280;
                font-size: 14px;
            }

            .action-buttons {
                display: flex;
                gap: 15px;
                margin-bottom: 30px;
                flex-wrap: wrap;
            }

            .btn-primary {
                flex: 1;
                min-width: 150px;
                padding: 14px 24px;
                background: linear-gradient(135deg, #22c55e 0%, #16a34a 100%);
                color: white;
                border: none;
                border-radius: 8px;
                font-weight: 700;
                font-size: 16px;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 6px 20px rgba(34, 197, 94, 0.3);
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                justify-content: center;
            }

            .btn-primary:hover {
                background: linear-gradient(135deg, #16a34a 0%, #15803d 100%);
                box-shadow: 0 10px 30px rgba(34, 197, 94, 0.4);
                transform: translateY(-2px);
            }

            .btn-secondary {
                flex: 1;
                min-width: 150px;
                padding: 14px 24px;
                background: transparent;
                color: #22c55e;
                border: 2px solid #22c55e;
                border-radius: 8px;
                font-weight: 700;
                font-size: 16px;
                cursor: pointer;
                transition: all 0.3s ease;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                justify-content: center;
            }

            .btn-secondary:hover {
                background: #f0fdf4;
                border-color: #16a34a;
                color: #16a34a;
            }

            /* Related Products Section */
            .related-products-section {
                margin-top: 50px;
                padding-top: 40px;
                border-top: 2px solid #e5e7eb;
            }

            .section-title {
                font-size: 26px;
                font-weight: 700;
                color: #1f2937;
                margin-bottom: 30px;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .section-title::before {
                content: " ";
                font-size: 28px;
            }

            .related-products-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 20px;
            }

            @media (max-width: 1200px) {
                .related-products-grid {
                    grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
                }
            }

            @media (max-width: 768px) {
                .related-products-grid {
                    grid-template-columns: repeat(2, 1fr);
                }
            }

            .product-card {
                background: #fff;
                border: 1px solid #e5e7eb;
                border-radius: 12px;
                padding: 16px;
                text-align: center;
                transition: all 0.3s ease;
                cursor: pointer;
            }

            .product-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 12px 28px rgba(0, 0, 0, 0.15);
                border-color: #22c55e;
            }

            .product-card-image {
                width: 100%;
                height: 160px;
                object-fit: contain;
                border-radius: 8px;
                background: #f8f9fa;
                margin-bottom: 12px;
            }

            .product-card-title {
                font-size: 14px;
                font-weight: 600;
                color: #1f2937;
                margin-bottom: 8px;
                line-height: 1.4;
                min-height: 28px;
            }

            .product-card-price {
                font-size: 16px;
                font-weight: 700;
                color: #22c55e;
                margin-bottom: 12px;
            }

            .product-card-buttons {
                display: flex;
                gap: 8px;
                flex-direction: column;
            }

            .btn-small {
                padding: 8px 12px;
                font-size: 12px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-weight: 600;
                transition: all 0.2s ease;
                text-decoration: none;
                display: inline-block;
            }

            .btn-small-primary {
                background: #22c55e;
                color: white;
            }

            .btn-small-primary:hover {
                background: #16a34a;
            }

            .btn-small-secondary {
                background: #f0f9ff;
                color: #22c55e;
                border: 1px solid #22c55e;
            }

            .btn-small-secondary:hover {
                background: #22c55e;
                color: white;
            }

            .no-products {
                grid-column: 1 / -1;
                text-align: center;
                padding: 40px;
                color: #6b7280;
                font-size: 16px;
            }

            .breadcrumb {
                margin-bottom: 30px;
            }

            .breadcrumb a {
                color: #22c55e;
                text-decoration: none;
                font-weight: 500;
            }

            .breadcrumb a:hover {
                text-decoration: underline;
            }

            .breadcrumb span {
                color: #9ca3af;
                margin: 0 8px;
            }

            .error-message {
                background: #fee2e2;
                color: #991b1b;
                padding: 16px;
                border-radius: 8px;
                border-left: 4px solid #dc2626;
                margin-bottom: 20px;
            }

            .quantity-selector {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 20px;
            }

            .quantity-selector label {
                font-weight: 600;
                color: #1f2937;
                min-width: 100px;
            }

            .quantity-input {
                width: 70px;
                padding: 8px;
                border: 1px solid #e5e7eb;
                border-radius: 6px;
                font-size: 14px;
                text-align: center;
            }
        </style>
    </asp:Content>

    <asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
        <div class="product-details-wrapper">
            <div class="container-fluid">
                <!-- Breadcrumb -->
                <div class="breadcrumb">
                    <a href="dashboard.aspx">Home</a>
                    <span></span>
                    <a href="product.aspx">Products</a>
                    <span></span>
                    <span id="breadcrumbProduct" runat="server">Product</span>
                </div>

                <!-- Product Details -->
                <asp:PlaceHolder ID="plhProductDetails" runat="server"></asp:PlaceHolder>

                <!-- Error Message -->
                <div id="errorDiv" class="error-message" style="display: none;" runat="server">
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </div>

                <!-- Related Products Section -->
                <div class="related-products-section">
                    <h2 class="section-title">Similar Products</h2>
                    <div class="related-products-grid">
                        <asp:Repeater ID="rptRelatedProducts" runat="server">
                            <ItemTemplate>
                                <div class="product-card">
                                    <img src='<%# Eval("ImageURL") %>' alt='<%# Eval("ProductName") %>'
                                        class="product-card-image" />
                                    <h5 class="product-card-title">
                                        <%# Eval("ProductName") %>
                                    </h5>
                                    <div class="product-card-price">₹<%# Eval("Price") %></div>
                                    <div class="product-card-buttons">
                                        <a href='ProductDetails.aspx?pid=<%# Eval("ProductID") %>'
                                            class="btn-small btn-small-secondary">View Details</a>
                                        <a href='AddToCart.aspx?productid=<%# Eval("ProductID") %>&price=<%# Eval("Price") %>&name=<%# HttpUtility.UrlEncode(Eval("ProductName").ToString()) %>&img=<%# HttpUtility.UrlEncode(Eval("ImageURL").ToString()) %>'
                                            class="btn-small btn-small-primary">Add to Cart</a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Label ID="lblNoProducts" runat="server" Text="No similar products found"
                            CssClass="no-products" Visible="false"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>