<%@ Page Title="" Language="C#" MasterPageFile="~/userside.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="Electronic_Shop.order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-group label { font-weight: 600; }
        .btn-primary { background-color: #28a745; border: none; }
        .btn-primary:hover { background-color: #218838; }
        .text-danger { font-size: 14px; }
        .card { background: #fff; border-radius: 10px; box-shadow: 0 4px 10px rgba(0,0,0,.08); padding: 24px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- If ScriptManager is NOT in Master, uncomment the next line:
    <asp:ScriptManager ID="ScriptManager1" runat="server" /> -->

    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <h2 class="mb-4 text-center">Place Your Order</h2>

                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger mb-3" HeaderText="Please fix the following:" />

                    <div class="form-group mb-3">
                        <label for="fname">First Name</label>
                        <asp:TextBox ID="fname" CssClass="form-control" runat="server" placeholder="Enter your first name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="fname" ErrorMessage="First name required" CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group mb-3">
                        <label for="address">Address</label>
                        <asp:TextBox ID="address" CssClass="form-control" runat="server" placeholder="Enter your address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="address" ErrorMessage="Address required" CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group mb-3">
                        <label for="email">Email</label>
                        <asp:TextBox ID="email" CssClass="form-control" runat="server" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="email" ErrorMessage="Email required" CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group mb-3">
                        <label for="mobileNumber">Mobile Number</label>
                        <asp:TextBox ID="mobileNumber" CssClass="form-control" runat="server" TextMode="Phone" placeholder="Enter your mobile number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="mobileNumber" ErrorMessage="Mobile required" CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group mb-4">
                        <label for="quantity">Quantity</label>
                        <asp:TextBox ID="quantity" CssClass="form-control" runat="server" TextMode="Number" placeholder="Enter quantity"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQty" runat="server" ControlToValidate="quantity" ErrorMessage="Quantity required" CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group mb-4">
                        <label>Select Payment Method</label>
                        <asp:RadioButtonList ID="rblPaymentMethod" runat="server" CssClass="list-group">
                            <asp:ListItem Value="COD" Text="Cash on Delivery" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="Card" Text="Credit / Debit Card"></asp:ListItem>
                            <asp:ListItem Value="UPI" Text="UPI / Net Banking"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <!-- Hidden fields for product ID and price -->
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    <asp:HiddenField ID="HiddenField2" runat="server" />

                    <!-- Hidden fields for product ID and price -->
                    <asp:HiddenField ID="hfProductID" runat="server" />
                    <asp:HiddenField ID="hfPrice" runat="server" />

                    <asp:Button ID="Button1" CssClass="btn btn-primary w-100" runat="server" Text="Place Order" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>