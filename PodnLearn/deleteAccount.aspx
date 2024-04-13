<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteAccount.aspx.cs" Inherits="PodnLearn.deleteAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete PodnLearn Account</title>
    <link rel="stylesheet" href="cssjs/authstyle.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div class="form">
        <h2>Deleting your</h2><h1 class="title">PodnLearn™</h1><h2>Account</h2>
        <p class="forget">Enter your credentials to delete your account.</p>
        <form id="form1" runat="server">
            <div class="input">
                <div class="inputBox">
                    <asp:Label runat="server" CssClass="label">Username</asp:Label>
                    <asp:TextBox runat="server" AutoPostBack="true" ID="txtUName" CssClass="inputCreds" ReadOnly="true" />
                </div>
                <div class="inputBox">
                    <asp:Label runat="server" CssClass="label">Password</asp:Label>
                    <asp:TextBox runat="server" AutoPostBack="true" CssClass="inputCreds" placeholder="********" ID="myInput" autocomplete="off" />
                    <span class="eye" onclick="myFunction()" >
                        <i id="hide1" class="fa fa-eye-slash"></i>
                        <i id="hide2" class="fa fa-eye"></i>
                    </span>
                </div>
                <asp:RequiredFieldValidator runat="server" ID="passwordV" ControlToValidate="myInput" ErrorMessage="Please enter the password" ForeColor="Red" />
            
                <div class="inputBox">
                    <asp:Button runat="server" ID="deleteBtn" name="submitBtn" Text="Delete Account" OnClick="deleteBtn_Click" />
                </div>
            </div>
        </form>
        <asp:Label runat="server" ID="errorText"></asp:Label>
    </div>
    <script src="cssjs/script.js"></script>
</body>
</html>
