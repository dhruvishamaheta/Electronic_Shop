<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_UserDetails.aspx.cs" Inherits="Electronic_Shop.Admin_UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .user-wrapper {
            width: 100%;
            padding: 0;
            margin: 0;
        }

        .user-section {
            width: 100%;
            padding: 40px 60px;
            box-sizing: border-box;
            background-color: #f4f6f8;
        }

        .user-section h2 {
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

        .btn-danger {
            padding: 6px 14px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 4px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="user-wrapper">
        <div class="user-section">
            <h2>User List</h2>

            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover"
                OnRowCommand="gvUsers_RowCommand" DataKeyNames="UserID">
                <Columns>
                    <asp:BoundField DataField="UserID" HeaderText="User ID" />
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                    <%--<asp:BoundField DataField="CreatedAt" HeaderText="Registered Date" DataFormatString="{0:dd/MM/yyyy}" />--%>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm"
                                CommandName="DeleteUser" CommandArgument='<%# Eval("UserID") %>'
                                OnClientClick="return confirm('Are you sure you want to delete this user?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
