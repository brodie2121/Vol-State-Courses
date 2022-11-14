"use strict";

$(document).ready(() => {
  $("#validate").click(() => {
    const phone = $("#phone").val();
    //const pattern = /^\d{3}-\d{3}-\d{4}$/; // 999-999-9999
    //const pattern = /^((1-)|(1 ))?\d{3}-\d{3}-\d{4}$/; //or to either 1- or "1 "
    //const pattern = //var pattern = /^((1(-|.))|(1 ))?\d{3}(-|.)\d{3}(-|.)\d{4}$/; // - or . to separate the digits.
    const pattern = /^((1(-|.))|(1 ))?(\d{3}|\(\d{3}\))(-|.)\d{3}(-|.)\d{4}$/;

    //test the phone number against the pattern
    //returns a True of False boolean value.
    const isValid = pattern.test(phone);

    //Display message based on isValid being True of False
    $("#message").text(isValid ? "Valid phone number" : "Invalid phone number");
    $("#phone").focus();
  }); // end click()

  $("#phone").val("123-456-7890"); // set default phone number
  $("#phone").focus(); // set focus on initial load
}); // end ready()
