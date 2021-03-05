import 'package:flutter/widgets.dart';
import 'package:flutter_app_getx_by_me/model/globalCountries.dart';
import 'package:flutter_app_getx_by_me/model/globalcoviddetails.dart';
import 'package:flutter_app_getx_by_me/model/particularCountryDetails.dart';

import 'base_url.dart';

class CovidDataSource {
  Future<GlobalDataController> loadGlobalData() {
    try {
      return Base_Url.get("");
    } catch (_) {
      debugPrint('Exception in the Base Url of the app');
    }
  }

  Future<CountryModel> loadAllCountries() {
    try {
      return Base_Url.getCountries("countries");
    } catch (_) {
      debugPrint('Exception in the Countries Url of the app');
    }
  }

  Future<ParticularCountryModel> loadCountryData(String CountryCode) {
    try {
      return Base_Url.getCountrySelected(CountryCode);
    } catch (_) {
      debugPrint('Exception in the selected country api ');
    }
  }
}
