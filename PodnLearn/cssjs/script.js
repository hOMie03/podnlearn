﻿function myFunction() {
    let x = document.getElementById("myInput");
    let y = document.getElementById("hide2");
    let z = document.getElementById("hide1");

    if (x.type === 'password') {
        x.type = "text";
        y.style.display = "block";
        z.style.display = "none";
    }
    else {
        x.type = "password";
        y.style.display = "none";
        z.style.display = "block";
    }
}