"use strict";
let timer = null;
let counter = 5;

const $ = (selector) => document.querySelector(selector);

const padSingleDigit = (num) => num.toString().padStart(2, "0");

const displayCurrentTime = function () {
  const today = new Date();
  const h = today.getHours();
  const m = today.getMinutes();
  const s = today.getSeconds();
  let ampm = "";
  if (h < 12) {
    ampm = "AM";
  } else {
    ampm = "PM";
  }
  document.getElementById("hours").innerHTML = padSingleDigit(h);
  document.getElementById("minutes").innerHTML = padSingleDigit(m);
  document.getElementById("seconds").innerHTML = padSingleDigit(s);
  document.getElementById("ampm").innerHTML = ampm;
};

document.addEventListener("DOMContentLoaded", () => {
  timer = setInterval(displayCurrentTime, 1000);
  // set initial clock display and then set interval timer to display
  // new time every second. Don't store timer object because it
  // won't be needed - clock will just run.
});
