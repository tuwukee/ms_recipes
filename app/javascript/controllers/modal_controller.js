import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    document.addEventListener('turbo:submit-end', this.handleSubmit)
  }

  disconnect() {
    document.removeEventListener('turbo:submit-end', this.handleSubmit)
  }

  close() {
    // Remove the modal element so it doesn't blanket the screen
    this.element.remove()
  }

  handleKeyup(e) {
    if (e.code == "Escape") {
      this.close()
    }
  }
}
