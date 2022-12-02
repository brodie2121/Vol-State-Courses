"use strict";

const scores = [];
const scoreSum = 0;

const displayScores = (scores, scoresString) => {
  for (let i = 0; i < scores.length; i++) {
    scoresString += `${
      scores[i]["firstName"] +
      " " +
      scores[i]["lastName"] +
      " = " +
      scores[i]["score"]
    } \n`;
  }
  return scoresString; // return the string
};

$(document).ready(() => {
  $("#add_button").click(() => {
    // get the add form ready for next entry
    const firstName = $("#first_name").val();
    const lastName = $("#last_name").val();
    const score = Number($("#score").val());
    if (firstName === "" || lastName === "" || score === NaN) {
      alert("Please enter a valid name and score.");
      return;
    }
    // add the score to the array
    const newScore = {
      firstName: firstName,
      lastName: lastName,
      score: score,
    };
    scores.push(newScore);
    scoreSum += score;
    // console.log(scoreSum);
    $("#scores").val(displayScores(scores, ""));
    // console.log(scoreSum / scores.length);
    $("#average_score").text(scoreSum / scores.length);

    //reset values
    $("#first_name").val("");
    $("#last_name").val("");
    $("#score").val("");
    $("#first_name").focus();
  });

  $("#clear_button").click(() => {
    console.log("clear button clicked");

    // remove the score data from the web page
    $("#average_score").html("");
    $("#score").val("");

    $("#first_name").val("").focus();
    $("#last_name").val("");
    $("#score").val("");
  });

  $("#sort_button").click(() => {
    console.log("sort button clicked");
    scores.sort((a, b) => {
      if (a.lastName > b.lastName) return 1; // return 1
      if (a.lastName < b.lastName) return -1; // return -1
      return 0;
    });
    $("#scores").val("");
    $("#scores").val(displayScores(scores, ""));
    $("#average_score").val(scoreSum / scores.length);
  });

  $("#first_name").focus();
});
