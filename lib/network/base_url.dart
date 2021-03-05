import 'dart:async';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter_app_getx_by_me/model/globalCountries.dart';
import 'package:flutter_app_getx_by_me/model/globalcoviddetails.dart';
import 'package:flutter_app_getx_by_me/model/particularCountryDetails.dart';
import 'package:http/http.dart' as http;

class Base_Url {
  static final String BASE_URL = "https://covid19.mathdro.id/api";
  static final String BASE_URL_COUNTRY =
      "https://covid19.mathdro.id/api/countries";

  static Future<GlobalDataController> get(String partUrl) async {
    try {
      String fullUrl = BASE_URL + "/" + partUrl;
      debugPrint("BaseNetwork-fullUrl : ${fullUrl}");
      final response = await http.get(fullUrl);
      debugPrint("BaseNetwork-fullUrl : ${response.body}");
      if (response.statusCode == 200) {
        return globalDataControllerFromJson(response.body);
      } else {
        return null;
      }
    } catch (_) {
      debugPrint(
          "Exception Has Occurred While recieving the data from the url");
    }
  }

  static Future<CountryModel> getCountries(String partUrl) async {
    try {
      String fullUrl = BASE_URL + "/" + partUrl;
      debugPrint("BaseNetwork-fullUrl : ${fullUrl}");
      final response = await http.get(fullUrl);
      debugPrint("AAAAAAAAAAAAAAAAAA : ${response.body}");
      if (response.statusCode == 200) {
        return countryModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (_) {
      debugPrint(
          "Exception Has Occurred While recieving the data from the url");
    }
  }

  /// returns the details of a particular country selected
  static Future<ParticularCountryModel> getCountrySelected(
      String countryCode) async {
    try {
      String fullUrl = BASE_URL_COUNTRY + "/" + countryCode;
      debugPrint("particular Country Url : $fullUrl");
      final response = await http.get(fullUrl);
      debugPrint("particular country Id  : ${response.body}");
      if (response.statusCode == 200) {
        return particularCountryModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (_) {
      debugPrint(
          "Exception Has Occurred While receiving the data from the selected country url");
    }
  }
}
