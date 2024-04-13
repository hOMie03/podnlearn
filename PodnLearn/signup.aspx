<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="PodnLearn.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign up to PodnLearn</title>
    <link rel="stylesheet" href="cssjs/authstyle.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div class="form">
        <h1 class="title">PodnLearn™</h1>
        <h2>Sign Up</h2>
        <span class="errorMsg">
        <asp:Label runat="server" ID="errorText"></asp:Label>
        </span>
        <form id="form1" runat="server">
            <div class="input">
                <div class="inputBox">
                    <asp:Label runat="server" CssClass="label">Username</asp:Label>
                    <asp:TextBox runat="server" AutoPostBack="true" ID="uname" CssClass="inputCreds" placeholder="joe69" />
                    <asp:RequiredFieldValidator runat="server" ID="usernameV" ControlToValidate="uname" ErrorMessage="Please enter your username" ForeColor="Red" />
                </div>
                <div class="inputBox">
                    <asp:Label runat="server" CssClass="label">Email</asp:Label>
                    <asp:TextBox runat="server" AutoPostBack="true" ID="email" TextMode="Email" CssClass="inputCreds" placeholder="qwerty@gmail.com" />
                    <asp:RequiredFieldValidator runat="server" ID="emailV" ControlToValidate="email" ErrorMessage="Please enter your email" ForeColor="Red" />
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
                    <asp:Label runat="server" CssClass="label">Name</asp:Label>
                    <asp:TextBox runat="server" AutoPostBack="true" ID="name" CssClass="inputCreds" placeholder="Joe Mama" />
                    <asp:RequiredFieldValidator runat="server" ID="nameV" ControlToValidate="name" ErrorMessage="Please enter your name" ForeColor="Red" />
                </div>
                <div class="inputBox">
                    <asp:Label runat="server" CssClass="label">Date of Birth</asp:Label>
                    <asp:TextBox runat="server" AutoPostBack="true" ID="dob" TextMode="Date" CssClass="inputCreds" />
                    <asp:RequiredFieldValidator runat="server" ID="dateV" ControlToValidate="dob" ErrorMessage="Please enter your date of birth" ForeColor="Red" />
                </div>
                <div class="inputBox">
                    <asp:Button runat="server" name="SubmitBtn" Text="Sign Up" OnClick="SubmitBtn_Click" />
                </div>
            </div>
        </form>
        <br />
        <p class="forget">Already have an account? <a href="login.aspx">Click here to Login</a>.</p>
        
    </div>
    <script src="cssjs/script.js"></script>
</body>
</html>
