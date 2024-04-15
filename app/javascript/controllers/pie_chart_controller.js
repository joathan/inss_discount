// app/javascript/controllers/pie_chart_controller.js
import { Controller } from "@hotwired/stimulus";
import Chart from "chart.js/auto";

export default class extends Controller {
  static targets = ["canvas"];

  connect() {
    this.resizeCanvas();
    this.drawChart();
  }

  resizeCanvas() {
    const canvas = this.canvasTarget;
    canvas.height = 200;
  }

  drawChart() {
    const ctx = this.canvasTarget.getContext("2d");
    const labels = JSON.parse(this.element.dataset.pieChartLabels);
    const data = JSON.parse(this.element.dataset.pieChartData);
    const backgroundColors = [
      "rgb(255, 99, 132)",
      "rgb(54, 162, 235)",
      "rgb(255, 205, 86)",
      "rgb(75, 192, 192)",
      "rgb(153, 102, 255)",
    ];

    new Chart(ctx, {
      type: "pie",
      data: {
        labels: labels,
        datasets: [
          {
            label: "total",
            data: data,
            backgroundColor: backgroundColors,
            hoverOffset: 4,
          },
        ],
      },
      options: {
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: true,
            position: "right",
            align: "center",
            title: {
              display: true,
              padding: 20,
              font: {
                size: 16,
              },
            },
          },
        },
        responsive: true,
        legend: {
          position: "right",
          labels: {
            fontColor: "#333",
            fontSize: 14,
          },
        },
      },
    });
  }
}
