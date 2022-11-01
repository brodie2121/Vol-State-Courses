"use strict";

const getRandomNumber = (max) => {
  let random = null;
  if (!isNaN(max)) {
    random = Math.random(); // value >= 0.0 and < 1.0
    random = Math.floor(random * max); // value is an integer between 0 and max - 1
    random = random + 1; // value is an integer between 1 and max
  }
  return random;
};

$(document).ready(() => {
  $("#generate").click(() => {
    $("#password").val(""); // clear previous entry

    // password variable
    let password = "";

    const chars =
      "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_-+!@";

    let nCharsValEntrdByUserInDForm = parseInt($("#num").val());

    // if not number then show alert
    if (isNaN(nCharsValEntrdByUserInDForm)) {
      alert("Enter a number only!");
      return;
    }

    // If variable is a number, start for loop
    for (let i = 0; i < nCharsValEntrdByUserInDForm; i++) {
      // call getRandomNumber function
      let start = getRandomNumber(chars.length);

      let stop = start + 1;

      // Using the "substring" method
      let char = chars.substring(start, stop);

      password += char;
    }

    // show newly generated password in the textbox After the end of FOR loop
    $("#password").val(password);
  }); // end click()

  $("#clear").click(() => {
    $("#num").val("");
    $("#password").val("");
    $("#num").focus();
  }); // end click()

  // set focus on initial load
  $("#num").focus();
}); // end ready()
