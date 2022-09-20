"use strict";

var $ = function (id) {
  return document.getElementById(id);
};

//validate the input and calculate results

var processEntries = function () {
  if (
    $("subtotal").value < 10000 &&
    $("subtotal").value > 0 &&
    $("taxrate").value > 0 &&
    $("taxrate").value < 12
  ) {
    $("salestax").value = ($("subtotal").value * $("taxrate").value) / 100;

    $("total").value =
      parseFloat($("salestax").value) + parseFloat($("subtotal").value);

    //focuses the pointer to the subtotal field

    $("subtotal").focus();
  }

  //create alert
  else {
    alert("Subtotal must be >0 and <10000 \n Tax rate must be >0 and <12");
  }
};

//this function is used to clear all the fields

var clearEntries = function () {
  $("salestax").value = "";

  $("total").value = "";

  $("subtotal").value = "";

  $("taxrate").value = "";

  $("subtotal").focus();
};

//this fn is used to clear the subtotal field

var clearSubtotal = function () {
  $("subtotal").value = "";
};

//this functionis used to clear the taxrate field

var clearTaxRate = function () {
  $("taxrate").value = "";
};

window.onload = function () {
  $("subtotal").focus();

  $("calculate").onclick = processEntries;

  $("clear").onclick = clearEntries;

  $("subtotal").onclick = clearSubtotal;

  $("taxrate").onclick = clearTaxRate;
};
