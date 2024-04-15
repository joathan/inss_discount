import { Controller } from "@hotwired/stimulus";
import IMask from "imask";

export default class extends Controller {
  static values = { type: String };

  connect() {
    this.initializeMask();
    this.element.addEventListener("blur", this.updateInputValue.bind(this));
  }

  initializeMask() {
    const maskOptions = this.maskOptions(this.typeValue);
    this.mask = IMask(this.element, maskOptions);

    this.mask.on("accept", () => {
      this.element.value = this.mask.value;
    });
  }

  updateInputValue() {
    if (this.mask) {
      this.element.value = this.mask.value;
    }
  }

  maskOptions(type) {
    switch (type) {
      case "currency":
        return {
          mask: "R$ num",
          blocks: {
            num: {
              mask: Number,
              thousandsSeparator: ".",
              radix: ",",
              scale: 2,
              normalizeZeros: true,
              padFractionalZeros: true,
            },
          },
        };
      case "cpf":
        return {
          mask: "000.000.000-00",
        };
      case "phone":
        return {
          mask: "(00) 00000-0000",
        };
      case "zip_code":
        return {
          mask: "00000-000",
        };
      default:
        return {}; 
    }
  }

  disconnect() {
    if (this.mask) {
      this.mask.destroy();
    }
  }
}
