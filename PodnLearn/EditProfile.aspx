<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="PodnLearn.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Profile</title>
    <link rel="shortcut icon" href="images/favicon.svg" type="image/svg+xml">
    <link rel="stylesheet" href="cssjs/homestyle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body id="top">
    <header class="active" data-header>
    <div class="container">
      <div class="overlay" data-overlay></div>
      <a href="Default.aspx" class="logo">
        <img src="images/logo.png" alt="PodnLearn logo">
      </a>

      <button class="nav-toggle-btn" data-nav-toggle-btn>
        <ion-icon name="menu-outline"></ion-icon>
      </button>

      <nav class="navbar" data-navbar>
        <ul class="navbar-list">

          <li class="navbar-item">
            <a href="Default.aspx" class="navbar-link">Home</a>
          </li>

          <li class="navbar-item">
            <a href="#podcast" class="navbar-link">Podcast</a>
          </li>

          <li class="navbar-item">
            <a href="Favorites.aspx" class="navbar-link">Favorites</a>
          </li>

          <li class="navbar-item">
            <a href="#" class="navbar-link">About Us</a>
          </li>

        </ul>

        <div class="navbar-actions">

        <a href="publishPodcast.aspx">
          <button class="navbar-btn">
            <ion-icon name="cloud-upload-outline"></ion-icon>
          </button>
        </a>

          <button class="navbar-btn">
            <ion-icon name="search-outline"></ion-icon>
          </button>

          <button class="navbar-btn">
            <ion-icon name="log-in-outline" aria-hidden="true"></ion-icon>
              <span>Switch to LearnAI</span>
          </button>

          <a href="profile.aspx">
            <button class="btn">
                <ion-icon name="person-circle"></ion-icon>
                <span><asp:Label ID="lblUsername" runat="server"></asp:Label></span>
            </button>
          </a>

        </div>
      </nav>

    </div>
  </header>

    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
  <main>
    <article class="container">
        <section class="newsletter">
        <div class="newsletter-card">

          <div class="card-content">
            <h3 class="h3 card-title">Edit Profile</h3>
            <p class="card-text">
              You can edit your profile here (Except your username. You cannot change your username).
            </p>
            <a href="deleteAccount.aspx">Delete your Account?</a>
          </div>
          <form runat="server" id="form1" class="card-form" data-form>
            <asp:TextBox runat="server" ID="txtUName" CssClass="input-field" placeholder="Your Username (Can't be changed)" ReadOnly="true" />
              <br />
            <asp:TextBox runat="server" ID="txtName" CssClass="input-field" placeholder="Edit Your Name" required="true" />
              <asp:RequiredFieldValidator runat="server" ID="txtNameV" ControlToValidate="txtName" ErrorMessage="Please edit the name" ForeColor="Red" />
            <asp:TextBox runat="server" ID="txtEmail" CssClass="input-field" placeholder="Edit Your Email" required="true" />
              <asp:RequiredFieldValidator runat="server" ID="txtEmailV" ControlToValidate="txtEmail" ErrorMessage="Please edit the e-mail" ForeColor="Red" />
            <asp:TextBox runat="server" ID="txtDOB" TextMode="Date" CssClass="input-field" placeholder="Edit Your Date of Birth" required="true" />
              <asp:RequiredFieldValidator runat="server" ID="txtDOBV" ControlToValidate="txtDOB" ErrorMessage="Please edit the date of birth" ForeColor="Red" />
            <asp:Button runat="server" Text="Save Changes" CssClass="btn btn-primary" ID="saveBtn" OnClick="saveBtn_Click" />
          </form>
            <asp:Label runat="server" ID="errorTxt" />
        </div>
      </section>
     </article>
   </main>


    
    <!-- custom js link -->
  <script src="cssjs/script.js"></script>

  <!-- ionicon link -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
