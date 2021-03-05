import 'package:get/get.dart';

import 'bindingGlobalController.dart';
import 'data_source_dependency.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    bindingGlobalController();
    bindingCovidDataSource();
  }
}
