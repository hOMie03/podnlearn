var audio = document.getElementById("audio-player");

audio.onloadedmetadata = function () {
    // Get the duration of the audio in seconds
    var duration = audio.duration;

    // Format the duration (optional)
    var formattedDuration = formatDuration(duration);

    // Display the duration in the HTML element
    var durationDisplay = document.getElementById("totalDuration");
    durationDisplay.textContent = formattedDuration;
};

// Function to format duration into minutes and seconds (optional)
function formatDuration(duration) {
    var minutes = Math.floor(duration / 60);
    var seconds = Math.floor(duration % 60);
    return minutes + ":" + seconds;
}


$(document).ready(function () {
    $("#play-button").click(function () {
        if ($(this).hasClass("unchecked")) {
            $(this)
                .addClass("play-active")
                .removeClass("play-inactive")
                .removeClass("unchecked");
            $(".info-two")
                .addClass("info-active");
            $("#pause-button")
                .addClass("scale-animation-active");
            $(".waves-animation-one, #pause-button, .seek-field, .volume-icon, .volume-field, .info-two").show();
            $(".waves-animation-two").hide();
            $("#pause-button")
                .children('.icon')
                .addClass("icon-pause")
                .removeClass("icon-play");
            setTimeout(function () {
                $(".info-one").hide();
            }, 400);
            audio.play();
            audio.currentTime = 0;
        } else {
            $(this)
                .removeClass("play-active")
                .addClass("play-inactive")
                .addClass("unchecked");
            $("#pause-button")
                .children(".icon")
                .addClass("icon-pause")
                .removeClass("icon-play");
            $(".info-two")
                .removeClass("info-active");
            $(".waves-animation-one, #pause-button, .seek-field, .volume-icon, .volume-field, .info-two").hide();
            $(".waves-animation-two").show();
            setTimeout(function () {
                $(".info-one").show();
            }, 150);
            audio.pause();
            audio.currentTime = 0;
        }
    });
    $("#pause-button").click(function () {
        var $icon = $(this).children(".icon");
        if ($icon.attr("name") === "pause") {
            $icon.attr("name", "play");
        } else {
            $icon.attr("name", "pause");
        }

        if (audio.paused) {
            audio.play();
        } else {
            audio.pause();
        }
    });
    $("#play-button").click(function () {
        setTimeout(function () {
            var $icon = $("#play-button").children(".icon");
            if ($icon.attr("name") === "play") {
                $icon.attr("name", "stop");
            } else {
                $icon.attr("name", "play");
            }
        }, 350);
    });
    $(".like").click(function () {
        $(".icon-heart").toggleClass("like-active");
    });
});

function CreateSeekBar() {
    var seekbar = document.getElementById("audioSeekBar");
    seekbar.min = 0;
    seekbar.max = audio.duration;
    seekbar.value = 0;
}

function EndofAudio() {
    document.getElementById("audioSeekBar").value = 0;
}

function AudioSeekBar() {
    var seekbar = document.getElementById("audioSeekBar");
    audio.currentTime = seekbar.value;
}

function SeekBar() {
    var seekbar = document.getElementById("audioSeekBar");
    seekbar.value = audio.currentTime;
}

audio.addEventListener("timeupdate", function () {
    var duration = document.getElementById("duration");
    var s = parseInt(audio.currentTime % 60);
    var m = parseInt((audio.currentTime / 60) % 60);
    duration.innerHTML = m + ':' + s;
}, false);

Waves.init();
Waves.attach("#play-button", ["waves-button", "waves-float"]);
Waves.attach("#pause-button", ["waves-button", "waves-float"]);