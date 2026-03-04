<%@ Page Title="Cart" Language="C#" MasterPageFile="~/userside.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Electronic_Shop.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .cart-wrapper {
            max-width: 900px;
            margin: 40px auto;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            font-family: 'Segoe UI', sans-serif;
        }

        .cart-title {
            font-size: 28px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 30px;
            text-align: center;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        .cart-table th,
        .cart-table td {
            padding: 16px;
            text-align: center;
            border-bottom: 1px solid #e5e7eb;
            font-size: 15px;
            color: #374151;
        }

        .cart-table th {
            background-color: #f9fafb;
            font-weight: 600;
            color: #1f2937;
        }

        .cart-table img {
            max-width: 100px;
            border-radius: 8px;
        }

        .cart-total {
            text-align: right;
            font-size: 18px;
            font-weight: 700;
            color: #22c55e;
            margin-top: 10px;
        }

        .cart-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            flex-wrap: wrap;
            gap: 15px;
        }

        .cart-buttons .btn {
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 15px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
        }

        .btn-remove {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #fca5a5;
        }

        .btn-remove:hover {
            background: #fca5a5;
            color: white;
        }

        .btn-order {
            background: #22c55e;
            color: white;
            border: none;
        }

        .btn-order:hover {
            background: #16a34a;
        }

        .btn-continue {
            background: #facc15;
            color: #1f2937;
            border: none;
            margin-top: 20px;
            text-align: center;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 15px;
            display: inline-block;
        }

        .text-danger {
            color: #dc2626;
            font-weight: 600;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="cart-wrapper">
        <h2 class="cart-title">Your Shopping Cart</h2>

        <!-- Cart Panel -->
        <asp:Panel ID="pnlCart" runat="server"></asp:Panel>

        <!-- Continue Shopping Button -->
        <a class="btn-continue" href="product.aspx">Continue Shopping</a>

        <!-- Optional Message -->
        <asp:Label ID="lblMsg" runat="server" CssClass="text-danger d-block mt-3"></asp:Label>
    </div>
</asp:Content>
