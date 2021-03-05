// To parse this JSON data, do
//
//     final globalDataController = globalDataControllerFromJson(jsonString);

import 'dart:convert';

GlobalDataController globalDataControllerFromJson(String str) => GlobalDataController.fromJson(json.decode(str));

String globalDataControllerToJson(GlobalDataController data) => json.encode(data.toJson());

class GlobalDataController {
  GlobalDataController({
    this.confirmed,
    this.recovered,
    this.deaths,
    this.dailySummary,
    this.dailyTimeSeries,
    this.image,
    this.source,
    this.countries,
    this.countryDetail,
    this.lastUpdate,
  });

  Confirmed confirmed;
  Confirmed recovered;
  Confirmed deaths;
  String dailySummary;
  CountryDetail dailyTimeSeries;
  String image;
  String source;
  String countries;
  CountryDetail countryDetail;
  DateTime lastUpdate;

  factory GlobalDataController.fromJson(Map<String, dynamic> json) => GlobalDataController(
    confirmed: json["confirmed"] == null ? null : Confirmed.fromJson(json["confirmed"]),
    recovered: json["recovered"] == null ? null : Confirmed.fromJson(json["recovered"]),
    deaths: json["deaths"] == null ? null : Confirmed.fromJson(json["deaths"]),
    dailySummary: json["dailySummary"] == null ? null : json["dailySummary"],
    dailyTimeSeries: json["dailyTimeSeries"] == null ? null : CountryDetail.fromJson(json["dailyTimeSeries"]),
    image: json["image"] == null ? null : json["image"],
    source: json["source"] == null ? null : json["source"],
    countries: json["countries"] == null ? null : json["countries"],
    countryDetail: json["countryDetail"] == null ? null : CountryDetail.fromJson(json["countryDetail"]),
    lastUpdate: json["lastUpdate"] == null ? null : DateTime.parse(json["lastUpdate"]),
  );

  Map<String, dynamic> toJson() => {
    "confirmed": confirmed == null ? null : confirmed.toJson(),
    "recovered": recovered == null ? null : recovered.toJson(),
    "deaths": deaths == null ? null : deaths.toJson(),
    "dailySummary": dailySummary == null ? null : dailySummary,
    "dailyTimeSeries": dailyTimeSeries == null ? null : dailyTimeSeries.toJson(),
    "image": image == null ? null : image,
    "source": source == null ? null : source,
    "countries": countries == null ? null : countries,
    "countryDetail": countryDetail == null ? null : countryDetail.toJson(),
    "lastUpdate": lastUpdate == null ? null : lastUpdate.toIso8601String(),
  };
}

class Confirmed {
  Confirmed({
    this.value,
    this.detail,
  });

  int value;
  String detail;

  factory Confirmed.fromJson(Map<String, dynamic> json) => Confirmed(
    value: json["value"] == null ? null : json["value"],
    detail: json["detail"] == null ? null : json["detail"],
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value,
    "detail": detail == null ? null : detail,
  };
}

class CountryDetail {
  CountryDetail({
    this.pattern,
    this.example,
  });

  String pattern;
  String example;

  factory CountryDetail.fromJson(Map<String, dynamic> json) => CountryDetail(
    pattern: json["pattern"] == null ? null : json["pattern"],
    example: json["example"] == null ? null : json["example"],
  );

  Map<String, dynamic> toJson() => {
    "pattern": pattern == null ? null : pattern,
    "example": example == null ? null : example,
  };
}
