/* eslint no-console:0 */
import RailsUjs from "rails-ujs";
import Turbolinks from "turbolinks";
import Vue from "vue";
import TurbolinksAdapter from "vue-turbolinks";

Vue.use(TurbolinksAdapter);
RailsUjs.start();
Turbolinks.start();

document.addEventListener("turbolinks:load", () => {
  new Vue({
    el: "#app",
    data: {
      message: "Hello Vue!"
    }
  });
});
