import { Controller } from "@hotwired/stimulus";
import $ from "jquery";
import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/css-stars";

export default class extends Controller {
  connect() {
    $(this.element).barrating({
      theme: "css-stars"
    });
  }
}
