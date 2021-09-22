// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener("turbolinks:load", () => {
  if (document.getElementsByClassName("wednesdays").length) {
    document
      .querySelectorAll(".wednesdays .coming-up .top")
      .forEach((element) => {
        element.addEventListener("click", function (e) {
          element.nextElementSibling.classList.toggle("open");
          element.classList.toggle("open");
        });
      });
  }

  if (document.getElementsByClassName("faqs").length) {
    document.querySelectorAll(".wtn .faqs .top").forEach((element) => {
      element.addEventListener("click", function (e) {
        element.nextElementSibling.classList.toggle("open");
        element.classList.toggle("open");
      });
    });
    document
      .querySelector(".toggle-accordions")
      .addEventListener("click", function (e) {
        e.target.nextElementSibling.classList.toggle("open");
        e.target.classList.toggle("open");

        document
          .querySelectorAll(".faqs .question > div")
          .forEach((element) => {
            element.classList.toggle("open");
          });
      });
  }
});
