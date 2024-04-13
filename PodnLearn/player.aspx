<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="player.aspx.cs" Inherits="PodnLearn.player" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Podcast Player</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="cssjs/playerstyle.css">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/node-waves/0.7.5/waves.min.css'>
</head>
<body>
    <div class="container">
    <form id="form1" runat="server">
  <div class="player">
    <div class="like waves-effect waves-light">
        <asp:Button ID="toggleFavoriteButton" CssClass="icon-heart" Width="35px" Height="30px" runat="server" Text="🤍" OnClick="toggleFavoriteButton_Click" />
        
    </div>
    <div class="mask"></div>
    <ul class="player-info info-one">
      <li><asp:Label runat="server" ID="addLabel" /></li>
      <li><asp:Label runat="server" ID="epName" /></li>
      <li><asp:Label runat="server" ID="podName" /></li>
      <a href="Default.aspx" style="color: black">Go to Home</a>
    </ul>
    <ul class="player-info info-two">
      <li><asp:Label runat="server" ID="epNameAgain" /></li>
      <li><asp:Label runat="server" ID="podNameAgain" /></li>
      <li><span id="duration"></span><i> / </i><asp:Label ID="totalDuration" runat="server" /></li>
    </ul>
    <div id="play-button" class="unchecked">
      <ion-icon name="play" class="icon icon-play"></ion-icon>
    </div>
    <div class="control-row">
      <div class="waves-animation-one"></div>
      <div class="waves-animation-two"></div>
      <div id="pause-button">
        <ion-icon class="icon icon-pause" name="pause"></ion-icon>
      </div>
      <div class="seek-field">
        <input id="audioSeekBar" min="0" max="334" step="1" value="0" type="range" oninput="AudioSeekBar()" onchange="this.oninput()" />
      </div>
      <div class="volume-icon">
        <ion-icon class="icon-volume-up" name="volume-high"></ion-icon>
      </div>
      <div class="volume-field">
        <input type="range" min="0" max="100" value="100" step="1" oninput="audio.volume = this.value/100" onchange="this.oninput()" />
      </div>
    </div>
  </div>

        <div>
            <audio id="audio-player" ontimeupdate="SeekBar()" ondurationchange="CreateSeekBar()" preload="auto" loop>
                Your browser does not support the audio element.
            </audio>
            <asp:Label runat="server" ID="thumbnailPathHidden" hidden="true" />
        </div>
    </form>
</div>

        

    
    <script src='https://cdnjs.cloudflare.com/ajax/libs/node-waves/0.7.5/waves.min.js'></script>
    <script type="text/javascript" src="cssjs/playerjs.js"></script>
    <script>
        // Retrieve podcast information from the server
        var podcastFilePath = '<%= PodcastFilePath %>';
        // Set the source of the audio player
        $('#audio-player').attr('src', podcastFilePath);

        var thumbnailFilePath = '<%= ThumbPath %>';
        $('.player').css('background-image', 'url(' + thumbnailFilePath + ')');
        $('.player').css('background-size', 'cover');

        function AudioSeekBar() {
            var seekbar = document.getElementById("audioSeekBar");
            audio.currentTime = seekbar.value;
        }
        
    </script>
    
  <!-- ionicon link -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>

    
</body>
</html>
