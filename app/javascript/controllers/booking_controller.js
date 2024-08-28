import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["status"];

  update(event) {
    event.preventDefault();

    const url = this.element.dataset.bookingUrl;

    fetch(url, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({
        booking: { status: "confirmed" }
      })
    })
    .then(response => response.json())
    .then(data => {
      if (data.status === 'success') {
        this.statusTarget.innerHTML = "Booking Confirmed";
        this.element.remove();
      } else {
        console.error("Error updating booking");
      }
    })
    .catch(error => {
      console.error("Fetch error:", error);
    });
  }
}
