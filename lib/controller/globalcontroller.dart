import 'package:flutter/cupertino.dart';
import 'package:flutter_app_getx_by_me/model/globalCountries.dart';
import 'package:flutter_app_getx_by_me/model/globalcoviddetails.dart';
import 'package:flutter_app_getx_by_me/model/particularCountryDetails.dart';
import 'package:flutter_app_getx_by_me/network/covid_data_source.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GlobalController extends GetxController {
  CovidDataSource covidDataSource;

  GlobalController(this.covidDataSource);

  var globalEntity = GlobalDataController().obs;
  var countryModel = CountryModel().obs;
  var particularCountryDetails = ParticularCountryModel().obs;

  /// variables that change contineously with every case
  var lastUpdate = "".obs;
  var confirmedTotal = 0.0.obs;
  var recoveredTotal = 0.0.obs;
  var deathTotal = 0.0.obs;

  ///variables for a particular Country Selected
  var countries = [].obs;
  var selectedCountry = "IDN".obs;
  var confirmedCountry = 0.0.obs;
  var recoveredCountry = 0.0.obs;
  var deathsCountry = 0.0.obs;
  var lastUpdateCountry = 0.0.obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    _fetchGlobalData();
    _fetchCountries();
    _fetchCountrySelectedData();
    super.onInit();
  }

  @override
  void onReady() {
    ever(selectedCountry, (_) {
      _fetchCountrySelectedData();
    });
    // // TODO: implement onReady
    super.onReady();
  }

  /// fetches all the latest details of the covid 19 cases round the world
  void _fetchGlobalData() async {
    var data = await covidDataSource.loadGlobalData();
    globalEntity.value = data;
    var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss")
        .parse(globalEntity.value.lastUpdate.toString(), true)
        .toUtc();
    var dateLocal = dateTime.toLocal();
    lastUpdate.value = dateLocal.toString();
    confirmedTotal.value = globalEntity.value.confirmed.value.toDouble();
    confirmedTotal.value = globalEntity.value.confirmed.value.toDouble();
    recoveredTotal.value = globalEntity.value.recovered.value.toDouble();
    deathTotal.value = globalEntity.value.deaths.value.toDouble();
  }

  /// fetches all the countries with covid 19 cases
  void _fetchCountries() async {
    var data = await covidDataSource.loadAllCountries();
    countryModel.value = data;
    countries.assignAll(countryModel.value.countries);
    isLoading.value = false;
  }

  ///fetches the details of a particular country
  void _fetchCountrySelectedData() async {
    try {
      var response =
          await covidDataSource.loadCountryData(selectedCountry.value);
      particularCountryDetails.value = response;

      confirmedCountry.value =
          particularCountryDetails.value.confirmed.value.toDouble();
      recoveredCountry.value =
          particularCountryDetails.value.recovered.value.toDouble();
      deathsCountry.value =
          particularCountryDetails.value.deaths.value.toDouble();
    } catch (_) {
      debugPrint(
          '"GlobalController error while fetching details from the server');
    }
  }
}
