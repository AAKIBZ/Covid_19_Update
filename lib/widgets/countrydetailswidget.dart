import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_getx_by_me/controller/globalcontroller.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class CountryDetailsWidget {
  final GlobalController _globalController = Get.find();

  Widget barChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Colors.yellow)),
          height: Get.height * 0.1,
          child: Row(
            children: [
              _confirmedWidget(),
              _dividerItem(),
              _deathWidget(),
              _dividerItem(),
              _recoveredWidget(),
            ],
          ),
        ),
        _countryVirusBarChart(),
      ],
    );
  }

  _confirmedWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Text('Confirmed'),
            SizedBox(
              height: 10,
            ),
            Obx(() => Text(
                  '${_globalController.confirmedCountry.value}',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  _deathWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Text('Deaths'),
            SizedBox(
              height: 10,
            ),
            Obx(() => Text(
                  '${_globalController.deathsCountry.value}',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  _recoveredWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Text('Recovered'),
            SizedBox(
              height: 10,
            ),
            Obx(() => Text(
                  '${_globalController.recoveredCountry.value}',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  _countryVirusBarChart() {
    return PieChart(
      chartType: ChartType.disc,
      colorList: [
        Colors.white60,
        Colors.red,
        Colors.green,
      ],
      chartRadius: 180,
      showLegends: false,
      chartValueStyle: TextStyle(color: Colors.black),
      dataMap: pieChartData(),
    );
  }

  Widget _dividerItem() {
    return Container(
      color: Colors.blue,
      width: 1.0,
      height: Get.height,
    );
  }

  Map<String, double> pieChartData() {
    Map<String, double> chartData = Map();
    chartData.putIfAbsent(
        'Confirmed', () => _globalController.confirmedCountry.value);
    chartData.putIfAbsent('death', () => _globalController.deathsCountry.value);
    chartData.putIfAbsent(
        'recovered', () => _globalController.recoveredCountry.value);
    return chartData;
  }
}
