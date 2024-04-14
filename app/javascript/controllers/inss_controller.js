import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["discount", "salary"];

  async calculate() {
    const salary = this.salaryTarget.value.replace(/\D/g, "");
    if (salary.length < 5) return;

    const response = await fetch(`/inss/calculate?salary=${salary}`);
    const data = await response.json();

    if (data.erro) {
      alert("Erro desconhecido!\nPor favor, tente novamente.\nSe o erro persistir, entre em contato com o suporte.");
      return;
    }

    this.discountTarget.value = data.inss_value;
  }
}
