import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-photo"
export default class extends Controller {
  static targets = ["fileInput", "userImg"]

  clickFileInput(){
    this.fileInputTarget.click()
  }

  addPicture(e) {
    const reader = new FileReader();
    const file = e.target.files[0]
      reader.addEventListener('load', (e) => {
        this.userImgTarget.style.backgroundImage = `url(${e.target.result})`;
      });

      reader.readAsDataURL(file);
  }
}
