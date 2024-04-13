<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="generateAI.aspx.cs" Inherits="PodnLearn.LearnAI.generateAI" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Generate LearnAI - PodnLearn</title>
    <link rel="shortcut icon" href="../images/favicon.svg" type="image/svg+xml">
    <link rel="stylesheet" href="../cssjs/homestyle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <header class="active" data-header>
    <div class="container">
      <div class="overlay" data-overlay></div>
      <a href="Default.aspx" class="logo">
        <img src="../images/logo.png" alt="PodnLearn logo">
      </a>

      <button class="nav-toggle-btn" data-nav-toggle-btn>
        <ion-icon name="menu-outline"></ion-icon>
      </button>

      <nav class="navbar" data-navbar>
        <ul class="navbar-list">

          <li class="navbar-item">
            <a href="Home.aspx" class="navbar-link">Home</a>
          </li>

          <li class="navbar-item">
            <a href="#ebook" class="navbar-link">E-Books</a>
          </li>

          <li class="navbar-item">
            <a href="FavoriteEBook.aspx" class="navbar-link">Favorites</a>
          </li>

          <li class="navbar-item">
            <a href="#" class="navbar-link">About Us</a>
          </li>

        </ul>

        <div class="navbar-actions">

        <a href="uploadEBook.aspx">
          <button class="navbar-btn">
            <ion-icon name="cloud-upload-outline"></ion-icon>
          </button>
        </a>


        <a href="../Default.aspx">
          <button class="navbar-btn">
            <ion-icon name="log-in-outline" aria-hidden="true"></ion-icon>
              <span>Switch to Podcasts</span>
          </button>
        </a>

          <a href="../profile.aspx">
            <button class="btn">
                <ion-icon name="person-circle"></ion-icon>
                <span><asp:Label ID="lblWelcome" runat="server"></asp:Label></span>
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
            <h3 class="h3 card-title">Generate LearnAI!</h3>
            <p class="card-text">
              Upload your E-book's PDF file here and select the voice you want to create podcast episode-like audio to listen to using LearnAI!
            </p>
          </div>
          <form runat="server" id="form1" class="card-form" data-form>
                <a href="Home.aspx">
                    <asp:Button runat="server" CssClass="btn btn-primary" ID="generateTTS" Text="Generate AI" OnClick="generateTTS_Click" />
                </a>
          </form>
            <asp:Label runat="server" ID="errorText" />
        </div>
      </section>
     </article>
   </main>

    
    
  <!-- ionicon link -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
