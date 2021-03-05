import 'package:flutter_app_getx_by_me/network/covid_data_source.dart';
import 'package:get/get.dart';

import '../globalcontroller.dart';

void bindingGlobalController() => Get.lazyPut<GlobalController>(
    () => GlobalController(Get.find<CovidDataSource>()));
