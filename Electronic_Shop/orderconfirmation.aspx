<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderconfirmation.aspx.cs" Inherits="Electronic_Shop.orderconfirmation" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Order Confirmation</title>
    <style>
        body {
            background-color: #f2f4f7;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
        }
        .card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 14px rgba(0,0,0,.08);
            padding: 30px;
        }
        h2 {
            color: #28a745;
            font-weight: 600;
            text-align: center;
            margin-bottom: 30px;
        }
        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        .detail-box {
            background: #f9f9f9;
            border-radius: 8px;
            padding: 15px 20px;
            font-size: 16px;
            color: #333;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        }
        .detail-box strong {
            display: block;
            margin-bottom: 6px;
            color: #555;
        }
        .total {
            font-weight: 700;
            color: #007bff;
            font-size: 18px;
            margin-top: 10px;
        }
        .meta {
            color: #666;
            font-size: 14px;
        }
        .product-image {
            text-align: center;
            margin: 30px 0;
        }
        .product-image img {
            max-width: 200px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .actions {
            margin-top: 30px;
            display: flex;
            gap: 12px;
            justify-content: center;
        }
        .btn {
            padding: 10px 18px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-size: 15px;
        }
        .btn-print {
            background: #343a40;
            color: #fff;
        }
        .btn-home {
            background: #28a745;
            color: #fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card">
                <h2>Order Confirmation</h2>

                <div class="product-image">
                    <asp:Image ID="imgProduct" runat="server" />
                </div>

                <div class="details-grid">
                    <div class="detail-box">
                        <strong>Name</strong>
                        <asp:Label ID="lblName" runat="server" />
                    </div>
                    <div class="detail-box">
                        <strong>Address</strong>
                        <asp:Label ID="lblAddress" runat="server" />
                    </div>
                    <div class="detail-box">
                        <strong>Email</strong>
                        <asp:Label ID="lblEmail" runat="server" />
                    </div>
                    <div class="detail-box">
                        <strong>Mobile</strong>
                        <asp:Label ID="lblMobile" runat="server" />
                    </div>
                    <div class="detail-box">
                        <strong>Product ID</strong>
                        <asp:Label ID="lblProductID" runat="server" />
                    </div>
                    <div class="detail-box">
                        <strong>Quantity</strong>
                        <asp:Label ID="lblQuantity" runat="server" />
                    </div>
                    <div class="detail-box">
                        <strong>Unit Price</strong>
                        <asp:Label ID="lblPrice" runat="server" />
                    </div>
                    <div class="detail-box">
                        <strong>Total Amount</strong>
                        <asp:Label ID="lblTotal" runat="server" CssClass="total" />
                    </div>
                    <div class="detail-box">
                        <strong>Order Date</strong>
                        <asp:Label ID="lblDate" runat="server" CssClass="meta" />
                    </div>
                    <div class="detail-box">
                        <strong>Status</strong>
                        <asp:Label ID="lblStatus" runat="server" CssClass="meta" />
                    </div>
                </div>

                <div class="actions">
                    <asp:Button ID="btnPrint" runat="server" Text="Print Bill" CssClass="btn btn-print" OnClientClick="window.print(); return false;" />
                    <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/dashboard.aspx" CssClass="btn btn-home" Text="Back to Home" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
