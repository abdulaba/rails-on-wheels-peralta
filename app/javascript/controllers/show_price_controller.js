import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-price"
export default class extends Controller {
  static targets = ["total", "startDate", "endDate"]
  static values = {
    dayPrice: Number
  }

  calcular() {
    const startD = new Date(this.startDateTarget.value)
    const endD = new Date(this.endDateTarget.value)
    const days = ((endD - startD)/3600000)/24
    const price = days * this.dayPriceValue
    this.totalTarget.innerText = ` ${price}$`
  }
}
