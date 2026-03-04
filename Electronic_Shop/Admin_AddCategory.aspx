<%@ Page Title="Manage Categories" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_AddCategory.aspx.cs" Inherits="Electronic_Shop.Admin_AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">

        <!-- Page Title -->
        <h2 class="text-primary mb-4">📂 Category & Subcategory Management</h2>

        <!-- Category Form -->
        <div class="card p-4 shadow-sm mb-4">
            <h4 class="text-secondary mb-3">➕ Add New Category</h4>
            <div class="mb-3">
                <label for="txtCategoryName" class="form-label">Category Name:</label>
                <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control" placeholder="Enter category name"></asp:TextBox>
            </div>
            <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" CssClass="btn btn-primary" OnClick="btnAddCategory_Click" />
        </div>

        <!-- Subcategory Form -->
        <div class="card p-4 shadow-sm mb-4">
            <h4 class="text-secondary mb-3">➕ Add New Subcategory</h4>
            <div class="mb-3">
                <label for="txtSubcategoryName" class="form-label">Subcategory Name:</label>
                <asp:TextBox ID="txtSubcategoryName" runat="server" CssClass="form-control" placeholder="Enter subcategory name"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="ddlCategories" class="form-label">Select Category:</label>
                <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <asp:Button ID="btnAddSubcategory" runat="server" Text="Add Subcategory" CssClass="btn btn-success" OnClick="btnAddSubcategory_Click" />
        </div>

        <!-- Existing Categories -->
        <div class="card p-4 shadow-sm mb-4">
            <h4 class="text-info mb-3">📁 Existing Categories</h4>
            <asp:GridView ID="gvCategories" runat="server" CssClass="table table-striped table-hover"
                AutoGenerateColumns="False" GridLines="None" DataKeyNames="CategoryID"
                OnRowDeleting="gvCategories_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="CategoryID" HeaderText="ID" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                    <asp:CommandField ShowDeleteButton="True" HeaderText="Actions" />
                </Columns>
            </asp:GridView>
        </div>

        <!-- Existing Subcategories -->
        <div class="card p-4 shadow-sm mb-4">
            <h4 class="text-info mb-3">📁 Existing Subcategories</h4>
            <asp:GridView ID="gvSubcategories" runat="server" CssClass="table table-striped table-hover"
                AutoGenerateColumns="False" GridLines="None" DataKeyNames="SubcategoryID"
                OnRowDeleting="gvSubcategories_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="SubcategoryID" HeaderText="ID" />
                    <asp:BoundField DataField="SubcategoryName" HeaderText="Subcategory Name" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                    <asp:CommandField ShowDeleteButton="True" HeaderText="Actions" />
                </Columns>
            </asp:GridView>
        </div>

    </div>
</asp:Content>
