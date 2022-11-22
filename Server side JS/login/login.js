"use strict";

const getCookieByName = (name) => {
  const start = cookies.indexOf(name);
  if (start === -1) {
    return "";
  } else {
    start = start + (name.length + 1);
    const end = cookies.indexOf(";", start);
    if (end === -1) {
      end = cookies.length;
    }
    const cookieValue = cookies.substring(start, end);
    return decodeURIComponent(cookieValue);
  }
};

const setCookie = (name, value, days) => {
  const cookieDateToBeSet = new Date();
  cookieDateToBeSet.setTime(
    cookieDateToBeSet.getTime() + days * 24 * 60 * 60 * 1000
  );
  let expires = "expires=" + cookieDateToBeSet.toUTCString();
  document.cookie = name + "=" + value + ";" + expires + ";path=/";
};

const deleteCookie = (name) => {
  document.cookie =
    document.cookie = `${name}=; expires=Thu, 02 Jan 1970 00:00:00 UTC; path=/;`;
};

const goToPage = (url) => {
  window.location.href = url;
};
