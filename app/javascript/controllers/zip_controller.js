import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["zip", "street", "city", "state"];

  async search() {
    const zip = this.zipTarget.value.replace(/\D/g, "");
    if (zip.length !== 8) return;

    const response = await fetch(`/zip/search?zip=${zip}`);
    const data = await response.json();

    if (data.erro) {
      alert("CEP não encontrado");
      return;
    }

    this.streetTarget.value = data.logradouro;
    this.cityTarget.value = data.localidade;
    this.stateTarget.value = data.uf;
  }
}
