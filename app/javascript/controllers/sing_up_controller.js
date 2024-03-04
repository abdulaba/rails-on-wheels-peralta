import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sing-up"
export default class extends Controller {

  newalert(event) {
    event.preventDefault()
    console.log(window)
    Swal.fire({
      title: "Good job!",
      text: "You clicked the button!",
      icon: "success"
    });
  }
}
