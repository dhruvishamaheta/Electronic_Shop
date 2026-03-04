<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Contact.aspx.cs" 
    Inherits="Electronic_Shop.Admin_Contact" MasterPageFile="~/AdminMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Contact</title>
    <style>
        .contact-wrapper {
            width: 100%;
            padding: 0;
            margin: 0;
        }

        .contact-section {
            width: 100%;
            padding: 40px 60px;
            box-sizing: border-box;
            background-color: #f4f6f8;
        }

        .contact-section h2 {
            font-size: 32px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 40px;
            background: linear-gradient(to right, #007bff, #00c6ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }

        .table th, .table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .table-striped tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .table-hover tbody tr:hover {
            background-color: #e6f2ff;
        }

        .table-bordered {
            border: 1px solid #ccc;
        }

        .gridview-container {
            overflow-x: auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact-wrapper">
        <div class="contact-section">
            <h2>Contact Submissions</h2>
            <div class="gridview-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"
                              CssClass="table table-bordered table-striped table-hover"
                              AllowPaging="true" PageSize="10"
                              AllowSorting="true">
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
