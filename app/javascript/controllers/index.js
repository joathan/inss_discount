import { application } from "./application";

import ZipController from "./zip_controller";
import RailsNestedForm from "@stimulus-components/rails-nested-form";

application.register("zip", ZipController);
application.register("nested-form", RailsNestedForm);
