<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_OrderDetails.aspx.cs" Inherits="Electronic_Shop.Admin_OrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <h2>Order List</h2>

    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" 
        OnRowCommand="gvOrders_RowCommand" DataKeyNames="OrderID">
        <Columns>
            <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
            <asp:BoundField DataField="UserID" HeaderText="User ID" />
            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" DataFormatString="{0:C}" />
            <asp:BoundField DataField="Status" HeaderText="Status" />



             <asp:TemplateField HeaderText="Actions">
           <ItemTemplate>
    <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-info btn-sm"
        CommandName="ViewOrder" CommandArgument='<%# Eval("OrderID") %>' />
    
    <asp:Button ID="btnConfirm" runat="server" Text="Confirm Order" CssClass="btn btn-success btn-sm"
        CommandName="ConfirmOrder" CommandArgument='<%# Eval("OrderID") %>'
        OnClientClick="return confirm('Are you sure you want to confirm this order?');" />

    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm"
        CommandName="DeleteOrder" CommandArgument='<%# Eval("OrderID") %>'
        OnClientClick="return confirm('Are you sure you want to delete this order?');" />
</ItemTemplate>

        </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
