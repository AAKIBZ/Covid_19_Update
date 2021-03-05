// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    this.countries,
  });

  List<Country> countries;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    countries: json["countries"] == null ? null : List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countries": countries == null ? null : List<dynamic>.from(countries.map((x) => x.toJson())),
  };
}

class Country {
  Country({
    this.name,
    this.iso2,
    this.iso3,
  });

  String name;
  String iso2;
  String iso3;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    name: json["name"] == null ? null : json["name"],
    iso2: json["iso2"] == null ? null : json["iso2"],
    iso3: json["iso3"] == null ? null : json["iso3"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "iso2": iso2 == null ? null : iso2,
    "iso3": iso3 == null ? null : iso3,
  };
}
