import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["item", "button"]

  removeItem() {
    console.log(this.itemTarget);
    this.itemTarget.remove();
  }
}
