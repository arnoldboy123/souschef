import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["item", "button", "form"]

  removeItem() {
    event.preventDefault();
    this.formTarget.submit();
    this.itemTarget.remove();
  }
}
