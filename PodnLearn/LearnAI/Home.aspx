<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PodnLearn.LearnAI.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LearnAI - Home</title>
    <link rel="shortcut icon" href="../images/favicon.svg" type="image/svg+xml">
    <link rel="stylesheet" href="../cssjs/homestyle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body id="top">
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
            <a href="#hero" class="navbar-link">Home</a>
          </li>

          <li class="navbar-item">
            <a href="#ebook" class="navbar-link">E-Books</a>
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

  <main>
    <article class="container">
      <section class="hero" id="hero">
        <div class="hero-content">
          <img src="../images/hero-title-learnAI.png" alt="Podcast" class="hero-title">
          <p class="hero-text">
            Welcome to the LearnAI. This is where you can read your favourite e-books in a different way. Just upload your e-book, select your preferred voice and ta-da! You can find your recently viewed e-books listen below.
          </p>
          
        </div>
        <div class="hero-banner" style="background: url('../images/learnAI-banner.png') no-repeat; background-size: cover;"></div>
      </section>
        <hr />
      <!-- #PODCAST -->
      <section class="podcast" id="ebook">
        <h1 class="social-title" style="font-size: 69px">Your E-books: </h1>
        <ul class="podcast-list">
          <asp:Literal runat="server" ID="podCard" />
        </ul>
          <br /><br />
        <p>You've reached the end of the list.</p>
      </section>

    </article>
  </main>
    <hr />
  <!-- #FOOTER -->
  <footer>
    <div class="footer-top">
      <div class="container">
        <div class="footer-brand">
          <a href="#" class="logo">
            <img src="../images/logo.png" alt="PodnLearn logo">
          </a>
          <p class="footer-text">
            PodnLearn© is a web application for podcast listener and book readers/enthusiasts, specifically e-book readers. Here you can listen to podcasts, and your own e-books for free!
          </p>
        </div>

        <ul class="footer-list">
          <li>
            <p class="footer-link-title">Post your feedback here:</p>
          </li>
          <li>
            <a href="mailto:podnlearn@hotmail.com" class="footer-link">hello@podnlearn.com</a>
          </li>
          <li>
            <a href="tel:+91 0123454678" class="footer-link">+91 01234 54678</a>
          </li>
        </ul>

        <div class="social-list-box">
          <p class="social-title">Follow Us On:</p>
          <ul class="social-list">
            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-twitter"></ion-icon>
              </a>
            </li>
            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-instagram"></ion-icon>
              </a>
            </li>
            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-soundcloud"></ion-icon>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <div class="footer-bottom">
      <div class="container">
        <p class="copyright">
          &copy; 2024 <a href="https://github.com/homie03">om auti</a>. All Rights Reserved
        </p>
      </div>
    </div>
  </footer>


  <!-- custom js link -->
  <script src="cssjs/script.js"></script>

  <!-- ionicon link -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>

</html>
