<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="Electronic_Shop.Admin_Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: url('https://img.freepik.com/free-photo/arrangement-black-friday-shopping-carts-with-copy-space_23-2148667047.jpg?semt=ais_hybrid&w=740&q=80')
                        no-repeat center center fixed;
            background-size: cover;
        }

        /* Dark overlay for readability */
        .overlay {
            background-color: rgba(0, 0, 0, 0.6);
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
            var passwordInput = document.getElementById('<%= txtPassword.ClientID %>');
            var checkBox = document.getElementById('chkShowPassword');
            passwordInput.type = checkBox.checked ? "text" : "password";
        }
    </script>
</head>

<body>
    <div class="overlay"></div>

    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card shadow p-4" style="width: 350px;">
            <h2 class="text-center mb-3">Admin Login</h2>

            <form id="form1" runat="server">
                <div class="mb-3">
                    <label class="form-label">Username:</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password:</label>
                    <asp:TextBox ID="txtPassword" runat="server"
                        CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>

                <div class="mb-3 form-check">
                    <input type="checkbox" id="chkShowPassword"
                        class="form-check-input" onclick="togglePassword()" />
                    <label for="chkShowPassword" class="form-check-label">
                        Show Password
                    </label>
                </div>

                <asp:Button ID="btnLogin" runat="server"
                    Text="Login"
                    CssClass="btn btn-primary w-100"
                    OnClick="btnLogin_Click" />

                <asp:Label ID="lblMessage" runat="server"
                    CssClass="text-danger mt-3 d-block text-center"></asp:Label>
            </form>
        </div>
    </div>
</body>
</html>
