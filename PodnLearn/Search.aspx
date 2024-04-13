<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="PodnLearn.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Podcasts - PodnLearn</title>
    <link rel="shortcut icon" href="images/favicon.svg" type="image/svg+xml">
    <link rel="stylesheet" href="cssjs/homestyle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        .search-box {
            position: absolute;
            top: 20%;
            left: 40%;
            background: #2f3640;
            height: 60px;
            border-radius: 40px;
            padding: 10px;
        }
        .search-box > .search-txt {
            width: 240px;
            padding: 0 6px;

        }
        .search-box:hover > .search-btn {
           background: white;
    
        }
        .search-btn {
            color: #e84118;
            float: right;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #2f3640;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: 0.4s;
        }
        .search-txt {
            border: none;
            background: none;
            outline: none;
            float: left;
            padding: 0;
            color: white;
            font-size: 16px;
            transition: 0.4s;
            line-height: 40px;
            width: 0px;
        }
    </style>
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

        <a href="Search.aspx">
          <button class="navbar-btn">
            <ion-icon name="search-outline"></ion-icon>
          </button>
        </a>

        <a href="LearnAI/Home.aspx">
          <button class="navbar-btn">
            <ion-icon name="log-in-outline" aria-hidden="true"></ion-icon>
              <span>Switch to LearnAI</span>
          </button>
        </a>

          <a href="profile.aspx">
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
                <div id="hero-content">
                    <form id="form1" runat="server">
                        <div class="search-box">
                            <asp:TextBox runat="server" CssClass="search-txt" ID="searchTxt" placeholder="Type to search" />
                            <asp:LinkButton runat="server" CssClass="search-btn" ID="btnSearch" OnClick="btnSearch_Click">
                                <i class="fas fa-search"></i>
                            </asp:LinkButton>
                        </div>
                    </form>
                </div>
            </section>
            <section class="podcast" id="podcast">
                <h1 class="social-title" style="font-size: 69px">Search Results: </h1>
                <ul class="podcast-list">
                    <asp:Literal ID="litSearchResults" runat="server"></asp:Literal>
                </ul>
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
            <img src="images/logo.png" alt="PodnLearn logo">
          </a>
          <p class="footer-text">
            Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt in felis malesuada mollis purus id sit in
            aliquet
            lectus eget morbi dui felis malesuada.
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
                <ion-icon name="logo-facebook"></ion-icon>
              </a>
            </li>
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
