import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["discount", "salary"];

  connect() {
    this.salaryTarget.addEventListener("blur", (event) => this.onBlur(event));
  }

  onBlur(event) {
    setTimeout(() => {
      this.calculate();
    }, 100); 
  }

  async calculate() {
    const salary = this.salaryTarget.value.replace(/\D/g, "");

    const response = await fetch(`/inss/calculate?salary=${salary}`);
    const data = await response.json();

    if (data.erro) {
      alert("Erro desconhecido!\nPor favor, tente novamente.\nSe o erro persistir, entre em contato com o suporte.");
      return;
    }

    this.discountTarget.value = this.formatCurrency(data.inss_value);
  }

  formatCurrency(value) {
    const number = Number(value);
    return number.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
  }
}
