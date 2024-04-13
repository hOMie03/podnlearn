var audio = null,
    analyser = null,
    audioContext = null,
    sourceNode = null,
    stream = null;

var barsColor = '#00CCFF';
var audioInput = document.getElementById('audiofile');
var timeRender = document.querySelector('.time .current');
var trackRender = document.querySelector('.track');
var audioText = document.getElementById("audioText");
var canvas, ctx;


var pdfOP = document.getElementById("pdfOpen");
pdfPath = document.getElementById("ebookPath").textContent;
pdfOP.src = pdfPath;
// choose file
audiofile.addEventListener('click', function (event) {
    stream = document.getElementById("audioURL").textContent;
    
    if (audio === null) {
        audio = new Audio();
        audio.src = stream;
        console.log(audio.src);
        audio.controls = true;
        audio.autoplay = true;
    }
    else {
        audio.removeAttribute('src');
        audio.load();
        audio.setAttribute('src', stream);
        audio.load();
        setTimeout(() => audio.play(), 400);
    }

    trackRender.textContent = audioText.textContent;
    barsColor = getComputedColor('.analyser');

    if (audioContext === null)
        setup();
});

function setup() {
    audio.addEventListener('canplay', function () {
        document.body.className += 'loaded';
        document.getElementById('audio_box').appendChild(audio);
        var AudioContext = window.AudioContext || window.webkitAudioContext;


        audioContext = new AudioContext();
        analyser = (analyser || audioContext.createAnalyser());

        sourceNode = audioContext.createMediaElementSource(audio);
        sourceNode.connect(analyser);
        sourceNode.connect(audioContext.destination);


        canvas = document.getElementById('analyser_render');
        ctx = canvas.getContext('2d');

        document.querySelector('.status').classList.add('play');
        document.querySelector('.duration').textContent = formatTime(audio.duration);

        audio.play();
        update();
    });
}

function update() {
    window.webkitRequestAnimationFrame(update);
    var fbc_array = new Uint8Array(analyser.frequencyBinCount);
    analyser.getByteFrequencyData(fbc_array);
    ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear the canvas
    ctx.fillStyle = barsColor; // Color of the bars
    var bars = 50;
    for (var i = 0; i < bars; i++) {
        var bar_x = i * 6;
        var bar_width = 5;
        var bar_height = -(fbc_array[i] / 2);
        ctx.fillRect(bar_x, canvas.height, bar_width, bar_height);
    }

    timeRender.textContent = formatTime(audio.currentTime);
}

function formatTime(seconds) {
    var minutes = Math.floor(seconds / 60);
    minutes = (minutes >= 10) ? minutes : "" + minutes;
    var seconds = Math.floor(seconds % 60);
    seconds = (seconds >= 10) ? seconds : "0" + seconds;
    return minutes + ":" + seconds;
}

function getComputedColor(selector) {
    var element = document.querySelector(selector);
    if (element.currentStyle)
        return element.currentStyle.backgroundColor;
    if (window.getComputedStyle) {
        var elementStyle = window.getComputedStyle(element, "");
        if (elementStyle)
            return elementStyle.getPropertyValue("color");
    }
    // Return 0 if both methods failed.  
    return 0;
}

document.querySelector('.play-button').addEventListener("click", e => {
    audio.play();
    document.querySelector('.status').classList.add('play');
}, false);

document.querySelector('.pause-button').addEventListener("click", e => {
    audio.pause();
    document.querySelector('.status').classList.remove('play');
}, false);

document.querySelector('.repeat-button').addEventListener("click", e => {
    var btn = e.currentTarget;
    if (!audio.loop) {
        audio.loop = true;
        btn.style.opacity = .5;
    }
    else {
        audio.loop = false;
        btn.style.opacity = .9;
    }

}, false);

document.querySelector('.open-button').addEventListener("click", e => {
    document.querySelector('#audiofile').click();
}, false);

