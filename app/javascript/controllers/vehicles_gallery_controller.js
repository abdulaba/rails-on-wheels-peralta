import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="vehicles-gallery"
export default class extends Controller {
  static targets = ["fileInput", "imageGallery"];

  clickFileInput(){
    this.fileInputTarget.click();
  }

  addNewPicture(e) {
    const dataTransfer = new DataTransfer()

    for (const file of e.target.files) {
      dataTransfer.items.add(file)
      const reader = new FileReader();
      reader.addEventListener('load', (e) => {
        const div = document.createElement("div");
        const img = document.createElement("img");

        trash.classList.add("fa-solid", "fa-trash");
        div.classList.add("col-4", "position-relative");
        trash.classList.add("position-absolute", "top-0", "left-0", "p-2", "text-danger")

        img.src = e.target.result;
        img.classList = "uploaded-image";
        div.append(trash)
        div.append(img);
        this.imageGalleryTarget.append(div);
      });

      reader.readAsDataURL(file);
      this.fileInputTarget.files = dataTransfer.files
      this.picsValue = dataTransfer.files
    }
  }
}
