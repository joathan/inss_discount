import { application } from "./application";

import HelloController from "./hello_controller";
import ZipController from "./zip_controller";

application.register("hello", HelloController);
application.register("zip", ZipController);