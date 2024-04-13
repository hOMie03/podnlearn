<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="PodnLearn.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Profile - PodnLearn</title>
    <link rel="shortcut icon" href="images/favicon.svg" type="image/svg+xml">
    <link rel="stylesheet" href="cssjs/homestyle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;500;700&display=swap" rel="stylesheet">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            <a href="Default.aspx#podcast" class="navbar-link">Podcasts</a>
          </li>

          <li class="navbar-item">
            <a href="LearnAI/Home.aspx" class="navbar-link">E-books</a>
          </li>

          <li class="navbar-item">
            <a href="#" class="navbar-link">About Us</a>
          </li>

        </ul>

        <div class="navbar-actions">

        <a href="Search.aspx">
          <button class="navbar-btn">
            <ion-icon name="search-outline"></ion-icon>
          </button>
        </a>
        <a href="help.aspx">
          <button class="navbar-btn">
              <ion-icon name="help-circle-outline"></ion-icon>
          </button>
        </a>
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

    <main>
    <article class="container">
      <section class="hero" id="hero">
        <div class="hero-content">
            <h1 class="social-title" style="font-size: 69px">Profile</h1>
            
          <div class="hero-btn-group">
            <div class="btn-link-wrapper">
                <p class="btn-title">Name: </p>
                <asp:Label ID="lblName" runat="server"></asp:Label>
            </div>
          </div>
          <br />
          <div class="hero-btn-group">
            <div class="btn-link-wrapper">
                <p class="btn-title">Username: </p>
                <asp:Label ID="lblUname" runat="server"></asp:Label>
            </div>
          </div>
          <br />
          <div class="hero-btn-group">
            <div class="btn-link-wrapper">
                <p class="btn-title">Email: </p>
                <asp:Label ID="lblEmail" runat="server"></asp:Label>
            </div>
          </div>
          <br />
          <div class="hero-btn-group">
            <div class="btn-link-wrapper">
                <p class="btn-title">DOB: </p>
                <asp:Label ID="lblDOB" runat="server"></asp:Label>
            </div>
          </div>
          <br />
          <div class="hero-btn-group">
            <div class="btn-link-wrapper">
                <p class="btn-title">Password: </p>
                <asp:Label ID="pswd" runat="server" Text="********"></asp:Label>
            </div>
          </div>
          <br />
          <div class="hero-btn-group">
            <div class="btn-link-wrapper">
                <a href="EditProfile.aspx">
                <button class="btn btn-primary" style="float:right">
                    <ion-icon name="create"></ion-icon>
                    <span>Edit Profile</span>
                </button>
                </a>

                <form runat="server">
                    <asp:Button runat="server" CssClass="btn btn-primary" ID="logoutBtn" Text="↪ Logout" OnClick="logoutBtn_Click" />
                </form>
            </div>
          </div>  
          
        </div>
        <div class="hero-banner"></div>
      </section>

      <hr />

      <!-- #PODCAST -->
      <section class="podcast" id="podcast">
        <h1 class="social-title" style="font-size: 69px">Your Recent Podcast Uploads: </h1>
        <ul class="podcast-list">
          <asp:Literal runat="server" ID="podCard" />
        </ul>
      </section>


    </article>
    </main>
    <asp:Label runat="server" ID="errorText" />



    <!-- custom js link -->
  <script src="cssjs/script.js"></script>

  <!-- ionicon link -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
