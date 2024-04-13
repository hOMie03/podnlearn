<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PodnLearn.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login to PodnLearn</title>
    <link rel="stylesheet" href="cssjs/authstyle.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div class="form">
        <h1 class="title">PodnLearn™</h1>
        <h2>Login</h2>
        <form id="form1" runat="server">
            <div class="input">
                <div class="inputBox">
                    <asp:Label runat="server" CssClass="label">Username</asp:Label>
                    <asp:TextBox runat="server" AutoPostBack="true" ID="uname" CssClass="inputCreds" placeholder="qwerty@gmail.com" />
                    <asp:RequiredFieldValidator runat="server" ID="usernameV" ControlToValidate="uname" ErrorMessage="Please enter your username" ForeColor="Red" />
                </div>
                <div class="inputBox">
                    <asp:Label runat="server" CssClass="label">Password</asp:Label>
                    <asp:TextBox runat="server" AutoPostBack="true" CssClass="inputCreds" placeholder="********" ID="myInput" autocomplete="off" />
                    <span class="eye" onclick="myFunction()" >
                        <i id="hide1" class="fa fa-eye-slash"></i>
                        <i id="hide2" class="fa fa-eye"></i>
                    </span>
                </div>
                    <asp:RequiredFieldValidator runat="server" ID="passwordV" ControlToValidate="myInput" ErrorMessage="Please enter your password" ForeColor="Red" />
                <div class="inputBox">
                    <asp:Button runat="server" name="SubmitBtn" Text="Sign In" OnClick="SubmitBtn_Click" />
                </div>
            </div>
            <p class="forget">Forget Password ? <a href="forgotpswd.aspx">Click Here</a></p>
        </form>
        <br />
        <asp:Label runat="server" ID="errorText"></asp:Label>
        <p class="forget">New here? <a href="signup.aspx">Click here to Sign Up</a>.</p>
        <span class="errorMsg">
        </span>
    </div>
    <script src="cssjs/script.js"></script>
</body>
</html>
