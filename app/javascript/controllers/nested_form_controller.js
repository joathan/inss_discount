import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["container", "template"];

  addAssociation(event) {
    event.preventDefault();
    const content = this.containerTarget
      .querySelector(".nested-fields")
      .outerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.containerTarget.insertAdjacentHTML("beforeend", content);
  }

  removeAssociation(event) {
    event.preventDefault();
    let wrapper = event.target.closest(".nested-fields");
    if (wrapper.dataset.newRecord === "true") {
      wrapper.remove();
    } else {
      wrapper.querySelector("input[name*='_destroy']").value = "1";
      wrapper.style.display = "none";
    }
  }
}
