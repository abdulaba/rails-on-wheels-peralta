import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gallery"
export default class extends Controller {
  static targets = ["fileInput", "addButton", "gallery"]

  connect() {
  }

  clickFileInput(){
    this.fileInputTarget.click()
  }

  deletePicture(e) {
    const id = e.target.dataset.signedid;
    document.querySelector(`input[value="${id}"]`).remove();
    e.target.parentNode.remove();
  }
}
