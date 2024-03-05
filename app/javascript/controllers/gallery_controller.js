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
    const id = e.target.dataset.signedid
    document.querySelector(`input[value="${id}"]`).remove()
    e.target.remove()
  }

  addPicture(e) {
    const reader = new FileReader();
    const file = e.target.files[0]
      reader.addEventListener('load', (e) => {
        const img = document.createElement("img");

        img.src = e.target.result;
        img.classList = "uploaded-image object-fit-cover col-4";
        this.galleryTarget.append(img);

      });

      reader.readAsDataURL(file);
  }
}
