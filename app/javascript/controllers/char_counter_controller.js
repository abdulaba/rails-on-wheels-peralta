import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="char-counter"
export default class extends Controller {
  static targets = ["text", "charCount"]

  connect() {
    let chars = this.textTarget.value.length
    this.charCountTarget.innerText = `${chars} caracteres`
  }

  count() {
    let chars = this.textTarget.value.length
    this.charCountTarget.innerText = `${chars} caracteres`
  }
}
