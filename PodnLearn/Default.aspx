<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PodnLearn.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home - PodnLearn</title>
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
            <a href="#hero" class="navbar-link">Home</a>
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
        <div class="hero-content">
          <img src="images/hero-title.png" alt="Podcast" class="hero-title">
          <p class="hero-text">
            Welcome to the PodnLearn Page. Explore new podcasts made by curated podcasters across the globe! Get recommendations from other podcast service providers down here below.
            <br />
            Listen to our exclusive episodes from our channel PodnLearn Exclusives. Generated and made with AI and its creator, together.
          </p>
          <div class="hero-btn-group">
            <div class="btn-link-wrapper">
              <p class="btn-title">Subscribe Us On:</p>
              <a href="#" class="btn-link">
                <ion-icon name="logo-apple"></ion-icon>
                <span>Apple Music</span>
              </a>
              <a href="#" class="btn-link">
                <ion-icon name="logo-soundcloud"></ion-icon>
                <span>SoundCloud</span>
              </a>
            </div>
          </div>
        </div>
        <div class="hero-banner"></div>
      </section>
        <hr />
      <!-- #PODCAST -->
      <section class="podcast" id="podcast">
        

          <h1 class="social-title" style="font-size: 69px">PodnLearn© Exclusive Podcasts: </h1>
        <ul class="podcast-list">
            <asp:Literal runat="server" ID="podCard" />
        </ul>
          <br /><br />
          <hr />
          <br /><br />
        <h1 class="social-title" style="font-size: 69px">Recommendations from the Web: </h1>
        <ul class="podcast-list">

          <li>
            <a href="https://music.amazon.in/podcasts/29771436-bfa6-4906-9028-0f6f7eb6efee/episodes/437ddc07-1193-4b03-8d5f-062ef118ed39/the-ranveer-show-secret-of-rudraksha-you-never-knew-before---shiva-purana-mantra-upasana-nepa-rudraksha-trs-388" class="podcast-card">
              <figure class="card-banner">
                <img src="https://i.scdn.co/image/ab6765630000ba8ade3404901270d81ee3bbc408" alt="Ep1">
                <div class="card-banner-icon">
                  <ion-icon name="play"></ion-icon>
                </div>
              </figure>
              <div class="card-content">
                <div class="card-meta">
                  <time datetime="2022-02-15">Mar 01, 2024</time>
                  <p class="pod-epi">Episode: 388</p>
                </div>
                <h3 class="h3 card-title">SECRET Of Rudraksha You Never Knew Before - Shiva Purana, Mantra, Upasana</h3>
              </div>
            </a>
          </li>

          <li>
            <a href="https://podcasts.google.com/feed/aHR0cHM6Ly9mZWVkcy5tZWdhcGhvbmUuZm0vUUNEODE2MzQ1NDkzMA/episode/YWU4YThjOWMtZDc4NS0xMWVlLWIzZDgtZmY1ZjQyOTdlZDQ3?sa=X&ved=0CAUQkfYCahcKEwjAoKSt_NWEAxUAAAAAHQAAAAAQAg" class="podcast-card">
              <figure class="card-banner">
                <img src="https://i.scdn.co/image/ab6765630000ba8a39fdc6f908d221189ec84d8b" alt="Ep2">
                <div class="card-banner-icon">
                  <ion-icon name="play"></ion-icon>
                </div>
              </figure>
              <div class="card-content">
                <div class="card-meta">
                  <time datetime="2022-02-15">Mar 01, 2024</time>
                  <p class="pod-epi">Episode: 3x101</p>
                </div>
                <h3 class="h3 card-title">It's Okay, We're Engineers</h3>
              </div>
            </a>
          </li>

          <li>
            <a href="https://scarystorypodcast.com/episode/the-delivery" class="podcast-card">

              <figure class="card-banner">
                <img src="https://i.scdn.co/image/ab6765630000ba8ad9bf61827b9967ea54c5c30f" alt="Ep3">
                <div class="card-banner-icon">
                  <ion-icon name="play"></ion-icon>
                </div>
              </figure>
              <div class="card-content">
                <div class="card-meta">
                  <time datetime="2022-02-15">Feb 20, 2024</time>
                  <p class="pod-epi">Episode: 5x3</p>
                </div>
                <h3 class="h3 card-title">The Delivery</h3>
              </div>
            </a>
          </li>

          <li>
            <a href="https://www.youtube.com/watch?v=b6vqucrfzg0" class="podcast-card">

              <figure class="card-banner">
                <img src="https://i.scdn.co/image/ab6765630000ba8aa4a9dd6df37a2226befe9259" alt="Ep4">
                <div class="card-banner-icon">
                  <ion-icon name="play"></ion-icon>
                </div>
              </figure>
              <div class="card-content">
                <div class="card-meta">
                  <time datetime="2022-02-15">Jan 27, 2024</time>
                  <p class="pod-epi">Episode: 188</p>
                </div>
                <h3 class="h3 card-title">DAD IS BACK! (ft. @PewDiePie)</h3>
              </div>
            </a>
          </li>
        </ul>
          <br /><br />
        <p>You've reached the end of the list.</p>

      </section>
        <hr />
      <!-- #NEWSLETTER -->
      <section class="newsletter">
        <div class="newsletter-card">

          <div class="card-content">
            <h3 class="h3 card-title">Sign Up For Our Newsletter. It’s Free!</h3>
            <p class="card-text">
              Join our newsletter list to get latest updates on your favorite podcasts, podcasters and learn more about PodnLearn©.
            </p>
          </div>

          <form runat="server" action="" class="card-form" data-form>
            <asp:TextBox runat="server" TextMode="Email" ID="email4newsletter" placeholder="Your Email Address" CssClass="input-field" required data-input />
            <asp:Button runat="server" CssClass="btn btn-primary" Text="Subscribe" ID="SubscribeButton" OnClick="SubscribeButton_Click" data-submit />
            <asp:Label runat="server" ID="successTxt" />
          </form>

        </div>
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
