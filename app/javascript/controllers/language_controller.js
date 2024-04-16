import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  change(event) {
    console.log("change");
    const language = event.currentTarget.dataset.language;
    document.cookie = `locale=${language};path=/;max-age=31536000`;
    window.location.reload();
  }
}
