<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpswd.aspx.cs" Inherits="PodnLearn.forgotpswd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="cssjs/authstyle.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div class="form">
        <h2>Forgot your</h2><h1 class="title">PodnLearn™</h1><h2>Account's Password</h2>
        <p class="forget">Enter your credentials to get a mail with your password.</p>
        <form id="form1" runat="server">
            <div class="input">
                <div class="inputBox">
                    <asp:Label runat="server" ID="lblEmail" CssClass="label">Email</asp:Label>
                    <asp:TextBox runat="server" AutoPostBack="true" ID="txtEmail" CssClass="inputCreds" />
                    <asp:RequiredFieldValidator runat="server" ID="EmailV" ControlToValidate="txtEmail" ErrorMessage="Please enter the email" ForeColor="Red" />
                </div>
            
                <div class="inputBox">
                    <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" OnClick="btnResetPassword_Click" />
                </div>
            </div>
        </form>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
    </div>
    <script src="cssjs/script.js"></script>
</body>
</html>
