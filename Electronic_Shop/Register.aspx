<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Electronic_Shop.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: url('https://img.freepik.com/premium-photo/shopping-concept-supermarket-trolley-money-gifts-background_494741-29308.jpg?semt=ais_hybrid&w=740&q=80')
                        no-repeat center center fixed;
            background-size: cover;
        }

        /* Dark overlay for readability */
        .overlay {
            background-color: rgba(0, 0, 0, 0.5);
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            z-index: -1;
        }
    </style>

    <script type="text/javascript">
        function togglePassword() {
            var pwd = document.getElementById('<%= txtPassword.ClientID %>');
            var confirmPwd = document.getElementById('<%= txtConfirmPassword.ClientID %>');
            var chk = document.getElementById('chkShowPassword');

            if (chk.checked) {
                pwd.type = "text";
                confirmPwd.type = "text";
            } else {
                pwd.type = "password";
                confirmPwd.type = "password";
            }
        }
    </script>
</head>

<body class="d-flex justify-content-center align-items-center vh-100">
    <div class="overlay"></div>

    <form id="form1" runat="server">
        <div class="card p-4 shadow" style="width: 400px;">
            <h3 class="text-center mb-3">Register</h3>

            <div class="mb-3">
                <label class="form-label">Full Name:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Mobile No:</label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"
                    TextMode="Email" required></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"
                    TextMode="Password" required></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Confirm Password:</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control"
                    TextMode="Password" required></asp:TextBox>
            </div>

            <div class="mb-3 form-check">
                <input type="checkbox" id="chkShowPassword"
                    class="form-check-input" onclick="togglePassword()" />
                <label for="chkShowPassword" class="form-check-label">
                    Show Password
                </label>
            </div>

            <asp:Button ID="btnRegister" runat="server"
                Text="Register"
                CssClass="btn btn-primary w-100"
                OnClick="btnRegister_Click" />

            <div class="text-center mt-3">
                Already have an account?
                <a href="Login.aspx">Login here</a>
            </div>

            <asp:Label ID="lblMessage" runat="server"
                CssClass="text-danger mt-3 d-block text-center"></asp:Label>
        </div>
    </form>
</body>
</html>
