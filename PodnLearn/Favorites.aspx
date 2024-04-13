<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Favorites.aspx.cs" Inherits="PodnLearn.Favorites" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Favorites</title>
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
    <br /><br /><br /><br /><br /><br /><br />
    <main>
    <article class="container">
        
      <!-- #PODCAST -->
      <section class="podcast" id="podcast">
        <h1 class="social-title" style="font-size: 69px">Your Favorites: </h1>
        <ul class="podcast-list">
          <asp:Literal runat="server" ID="podCard" />
        </ul>
      </section>

    </article>
    </main>



    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" ID="textOP" Text="No more Favorites. Stream some podcasts to favorite it!"/>
        </div>
    </form>


    
    <!-- custom js link -->
  <script src="cssjs/script.js"></script>

  <!-- ionicon link -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
