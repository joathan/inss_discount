import { application } from "./application";

import ZipController from "./zip_controller";
import RailsNestedForm from "@stimulus-components/rails-nested-form";
import InssController from "./inss_controller";

application.register("zip", ZipController);
application.register("nested-form", RailsNestedForm);
application.register("inss", InssController);