import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["item", "form"]

  submitForm() {
    this.formTarget.submit();
    this.itemTarget.remove();
  }
}
