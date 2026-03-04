<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="Admin_ShowProduct.aspx.cs" Inherits="Electronic_Shop.Admin_ShowProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .product-wrapper {
            width: 100%;
            padding: 0;
            margin: 0;
        }

        .product-section {
            width: 100%;
            padding: 40px 60px;
            box-sizing: border-box;
            background-color: #f4f6f8;
        }

        .product-section h2 {
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

        .table th {
            background-color: #007bff;
            color: white;
            padding: 14px;
            text-align: center;
        }

        .table td {
            padding: 12px;
            text-align: center;
            vertical-align: middle;
        }

        .table-hover tbody tr:hover {
            background-color: #e6f2ff;
        }

        .btn-warning, .btn-danger {
            padding: 6px 14px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 4px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-wrapper">
        <div class="product-section">
            <h2>Product List</h2>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
                OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting"
                CssClass="table table-striped table-bordered table-hover">
                <Columns>
                    <asp:TemplateField HeaderText="Product Id">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Product Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Quantity") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" CommandName="Edit" CommandArgument='<%# Eval("ProductID") %>'
                                runat="server" Text="Edit" CssClass="btn btn-warning btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonDelete" CommandName="Delete"
                                CommandArgument='<%# Eval("ProductID") %>' runat="server" Text="Delete"
                                CssClass="btn btn-danger btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
