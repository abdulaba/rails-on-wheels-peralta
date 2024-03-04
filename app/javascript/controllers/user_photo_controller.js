import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-photo"
export default class extends Controller {
  static targets = ["fileInput"]

  clickFileInput(){
    this.fileInputTarget.click()
  }
}
