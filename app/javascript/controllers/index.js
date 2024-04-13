import { application } from "./application";

import HelloController from "./hello_controller";
import NestedFormController from "./nested_form_controller";
import ZipController from "./zip_controller";

application.register("hello", HelloController);
application.register("nested-form", NestedFormController);
application.register("zip", ZipController);