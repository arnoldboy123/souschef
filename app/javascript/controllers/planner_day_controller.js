import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["meal", "form"]

  revealContent() {
    this.mealTarget.classList.remove("d-none");
  }

  submitForm() {
    console.log("submitting?");
    this.formTarget.submit();
  }
}
