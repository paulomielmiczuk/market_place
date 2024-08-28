import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    console.log("Flatpickr connected")
    flatpickr(this.element, {
      dateFormat: 'd/m/Y'
    });
  }
}
