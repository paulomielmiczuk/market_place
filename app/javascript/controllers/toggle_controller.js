import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["status"]

  confirm() {
    fetch(this.data.get("url"), {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({ status: true })
    })
    .then(response => {
      if (response.ok) {
        this.statusTarget.classList.add("confirmed");
        alert('Booking confirmed!');
      } else {
        alert('An error occurred.');
      }
    });
  }
}
