import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delete-alert"
export default class extends Controller {
  static targets = ["delete"]

  confirm(e) {
    e.preventDefault()
    Swal.fire({
      title: "¿Seguro que quieres borrar este vehiculo?",
      icon: "warning",
      showDenyButton: true,
      confirmButtonText: "No borrar",
      denyButtonText: `Borrar`
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isDenied) {
        this.deleteTarget.click()
      }
    });
  }
}
