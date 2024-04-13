<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ebookPlayer.aspx.cs" Inherits="PodnLearn.LearnAI.ebookPlayer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LearnAI - PodnLearn</title>
    <link rel="stylesheet" href="../cssjs/ebookplayerstyle.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
</head>
<body style="background-color: hsl(252, 100%, 12%);">
    <header style="background-color: #000; text-align: center">
        <nav>
            <ul>
              <a href="Default.aspx" class="logo">
                <img src="../images/logo.png" alt="PodnLearn logo" width="100">
              </a>
                <br />
                <a href="Home.aspx" style="color: white">Home</a>
            </ul>
        </nav>
    </header>
    <div class="hidden">
  <button id="audiofile"></button>
  <div id="audio_box"></div>
  <asp:Label runat="server" ID="audioText" />
  <asp:Label runat="server" ID="audioURL" />
  <asp:Label runat="server" ID="ebookPath" />
</div>

<br />
<embed id="pdfOpen" type="application/pdf" style="align-self: center" width="50%" height="400px" />
<br />
<div class="demo">
  <div id="player">
    <div class="visor">
      <div class="time">
        <span class="current">0:00</span>
        <span class="duration">/0:00</span>
      </div>
      <div class="info">
        <div class="track">E-book Title</div>
        <div class="status">
          <span></span>
          <span><i class="zmdi zmdi-surround-sound"></i></span>
        </div>
      </div>
    </div>
    <div class="controls">
      <button class="open-button" alt="open">
          <i class="zmdi zmdi-eject"></i>
        </button>
      <button class="play-button" alt="play">
          <i class="zmdi zmdi-play"></i>
        </button>
        <button class="pause-button" alt="pause">
          <i class="zmdi zmdi-pause"></i>
        </button>
      <button class="repeat-button" alt="repeat" title="repeat">
          <i class="zmdi zmdi-repeat"></i>
        </button>
    </div>
    <div class="analyser">
      <canvas id="analyser_render"></canvas>
    </div>
      <div id="themes">
          <div class="radio">
              <label class="radio-label">Press <i class="zmdi zmdi-eject"></i> to play.</label>
          </div>
      </div>
  </div>
</div>


<footer class="title" style="text-align: center;">
    Powered by LearnAI©. PodnLearn made in India by <a href="https://github.com/hOMie03/">©om auti</a>

</footer>
    <script type="text/javascript" src="../cssjs/ebookplayer.js"></script>
</body>
</html>
