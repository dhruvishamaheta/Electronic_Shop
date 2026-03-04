<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_Dashboard.aspx.cs" Inherits="Electronic_Shop.Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dashboard-wrapper {
            width: 100%;
            padding: 40px 60px;
            box-sizing: border-box;
            background-color: #f4f6f8;
        }

        .dashboard-title {
            font-size: 32px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            background: linear-gradient(to right, #007bff, #00c6ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .dashboard-subtitle {
            text-align: center;
            font-size: 18px;
            color: #555;
            margin-bottom: 40px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-wrapper">
        <div class="dashboard-title">Welcome to Admin Dashboard</div>
        <div class="dashboard-subtitle">Manage products, users, and orders efficiently.</div>
    </div>
</asp:Content>
