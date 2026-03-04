<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_AddProduct.aspx.cs" Inherits="Electronic_Shop.Admin_AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-wrapper {
            width: 100%;
            padding: 40px 60px;
            box-sizing: border-box;
            background-color: #f4f6f8;
        }

        .form-title {
            font-size: 32px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 40px;
            background: linear-gradient(to right, #007bff, #00c6ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .btn-primary {
            width: 100%;
            padding: 14px;
            font-size: 18px;
            font-weight: bold;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-wrapper">
        <div class="form-title">Add New Product</div>

        <div class="form-group">
            <label>Product Name:</label>
            <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Price:</label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Quantity:</label>
            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Image URL:</label>
            <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Category:</label>
            <asp:TextBox ID="txtCategorie" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Subcategory:</label>
            <asp:TextBox ID="txtSubcategories" runat="server" CssClass="form-control" />
        </div>

        <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn btn-primary" OnClick="btnAddProduct_Click" />
    </div>
</asp:Content>
