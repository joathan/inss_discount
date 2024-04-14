import { application } from "./application";

import ZipController from "./zip_controller";
import RailsNestedForm from "@stimulus-components/rails-nested-form";
import InssController from "./inss_controller";
import Chartjs from "@stimulus-components/chartjs";
import pie_chart from "./pie_chart_controller";

application.register("zip", ZipController);
application.register("nested-form", RailsNestedForm);
application.register("inss", InssController);
application.register("chart", Chartjs);
application.register("pie-chart", pie_chart);
