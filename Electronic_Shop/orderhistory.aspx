<%@ Page Title="" Language="C#" MasterPageFile="~/userside.Master" AutoEventWireup="true" CodeBehind="orderhistory.aspx.cs" Inherits="Electronic_Shop.orderhistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #f0f2f5;
        }

        .order-history-wrapper {
            padding: 40px 60px;
        }

        .order-history-container {
    width: 100%;
    padding: 20px 30px;
    box-sizing: border-box;
    background: #fff;
    border-radius: 0;
    box-shadow: none;

        }

        .order-history-container h2 {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
            color: #2c3e50;
            text-align: center;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 14px 16px;
            border: 1px solid #ddd;
            text-align: center;
            font-size: 15px;
        }

        .table th {
            background-color: #eaf0f6;
            font-weight: 600;
            color: #34495e;
        }

        .table tbody tr:hover {
            background-color: #f9f9f9;
        }

        .product-img {
            border-radius: 6px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .status-pending {
            background-color: #fff3cd;
            color: #856404;
            padding: 6px 12px;
            border-radius: 6px;
            font-weight: 500;
        }

        .status-completed {
            background-color: #d4edda;
            color: #155724;
            padding: 6px 12px;
            border-radius: 6px;
            font-weight: 500;
        }

        .status-cancelled {
            background-color: #f8d7da;
            color: #721c24;
            padding: 6px 12px;
            border-radius: 6px;
            font-weight: 500;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="order-history-wrapper">
        <div class="order-history-container">
            <h2>Your Order History</h2>

            <asp:Repeater ID="rptOrderHistory" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Order ID</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Total Amount</th>
                                <th>Order Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><img src='<%# Eval("ImageURL") %>' class="product-img" alt="Product Image" height="50" width="50"></td>
                        <td><%# Eval("OrderID") %></td>
                        <td><%# Eval("ProductName") %></td>
                        <td><%# Eval("Quantity") %></td>
                        <td>₹<%# Eval("Price") %></td>
                        <td>₹<%# Eval("TotalAmount") %></td>
                        <td><%# Eval("OrderDate", "{0:dd-MM-yyyy hh:mm tt}") %></td>
                        <td>
                            <span class='<%# GetStatusClass(Eval("Status").ToString()) %>'>
                                <%# Eval("Status") %>
                            </span>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                        </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
