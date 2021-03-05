import 'package:flutter_app_getx_by_me/network/covid_data_source.dart';
import 'package:get/get.dart';

void bindingCovidDataSource() =>
    Get.lazyPut<CovidDataSource>(() => CovidDataSource());
