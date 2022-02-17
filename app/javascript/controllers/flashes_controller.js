import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flashes"
export default class extends Controller {
  connect() {
    if (this.element) {
      // setTimeout(() => this.element.remove(), 5 * 1000);
    }
  }

  close() {
    if (this.element) {
      this.element.remove();
    }
  }
}
