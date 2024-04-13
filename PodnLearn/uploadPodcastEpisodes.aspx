<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploadPodcastEpisodes.aspx.cs" Inherits="PodnLearn.uploadPodcast" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload Podcast Episode</title>
    <link rel="shortcut icon" href="images/favicon.svg" type="image/svg+xml">
    <link rel="stylesheet" href="cssjs/homestyle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
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
            <h3 class="h3 card-title">Upload the Episode for your podcast!</h3>
            <p class="card-text">
              Done recording of your new episode of your podcast? Upload it, your curators are waiting for it!!
            </p>
          </div>
          <form runat="server" id="form1" class="card-form" data-form>
            <p>Podcast Name:</p>
            <asp:TextBox runat="server" CssClass="input-field" ID="podcastName" ReadOnly="true" />
              <br />
            <p>Podcast ID:</p>
            <asp:TextBox runat="server" CssClass="input-field" ID="podcastID" ReadOnly="true" />
              <br />
            <p>Name of the Episode:</p>
            <asp:TextBox runat="server" ID="episodeName" CssClass="input-field" />
              <asp:RequiredFieldValidator runat="server" ID="episodeNameV" ControlToValidate="episodeName" ErrorMessage="Please enter episode name for your podcast" ForeColor="Red" />
            <br />
              <p>Number of the Episode:</p>
            <asp:TextBox runat="server" CssClass="input-field" TextMode="Number" ID="podEPNo" />
              <asp:RequiredFieldValidator runat="server" ID="podEPNoV" ControlToValidate="podEPNo" ErrorMessage="Please give the episode number" ForeColor="Red" />
            <br />
              <p>Select Podcast Episode Audio File:</p>
            <asp:FileUpload ID="fileUploadAudio" runat="server" CssClass="input-field" />
              <asp:RequiredFieldValidator runat="server" ID="fileUploadAudioV" ControlToValidate="fileUploadAudio" ErrorMessage="Please provide the audio file of your podcast" ForeColor="Red" />
              <asp:Button runat="server" Text="Upload" CssClass="btn btn-primary" ID="saveBtn" OnClick="btnUpload_Click" />
          </form>
            <asp:Label runat="server" ID="errorText" />
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
