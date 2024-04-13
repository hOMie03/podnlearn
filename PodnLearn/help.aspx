<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="help.aspx.cs" Inherits="PodnLearn.help" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Help - PodnLearn</title>
	    <link rel="icon" href="images/bot.png" />
	    <link rel="stylesheet" href="cssjs/helpBot/helpstyle.css" />
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


      <nav class="navbar" data-navbar>
        <ul class="navbar-list">

          <li class="navbar-item">
            <a href="Default.aspx" class="navbar-link">Home</a>
          </li>

          <li class="navbar-item">
            <a href="Default.aspx#podcast" class="navbar-link">Podcast</a>
          </li>

          <li class="navbar-item">
            <a href="Favorites.aspx" class="navbar-link">Favorites</a>
          </li>


        </ul>

        
      </nav>

    </div>
  </header>
        <h1 style="display: flex; align-items: center; justify-content: center; color: #fff">Help Bot for PodnLearn©</h1>
        <div id="container" class="container">
		    <div id="chat" class="chat">
			    <div id="messages" class="messages"></div>
			    <input id="input" type="text" placeholder="Say something..." autocomplete="off" autofocus="true" />
		    </div>
		    <img src="images/bot.png" alt="Robot cartoon" height="400vh" />
	    </div>
    <footer class="title" style="text-align: center; background-color: #333; color: #fff; padding: 10px">
    Powered by LearnAI©. PodnLearn made in India by <a href="https://github.com/hOMie03/" style="color: antiquewhite">©om auti</a>
    </footer>
    </body>


    <script type="text/javascript" src="cssjs/helpBot/helpscript.js" ></script>
    <script type="text/javascript" src="cssjs/helpBot/constants.js" ></script>
    <script type="text/javascript" src="cssjs/helpBot/speech.js" ></script>

    
  <!-- ionicon link -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</html>
