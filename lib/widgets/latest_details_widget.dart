import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_getx_by_me/controller/globalcontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pie_chart/pie_chart.dart';

class LatestDetails {
  final GlobalController controller = Get.find<GlobalController>();

  Widget latestDetails() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: _totalConfirmed(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: _totalRecovered(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: _totalDeaths(),
                    )
                  ]),
            ),
            Expanded(
              child: Obx(
                () => PieChart(
                  chartType: ChartType.disc,
                  colorList: [
                    Colors.white60,
                    Colors.red,
                    Colors.green,
                  ],
                  chartRadius: 180,
                  showLegends: false,
                  chartValueStyle: TextStyle(color: Colors.black),
                  dataMap: _showChartData(),
                ),
              ),
            ),
          ]),
    );
  }

  _totalConfirmed() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Total Confirmed'),
        SizedBox(
          height: 5,
        ),
        Obx(
          () => Text(controller.confirmedTotal.value.toString(),
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        )
      ],
    );
  }

  _totalRecovered() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Total recovered'),
        SizedBox(
          height: 5,
        ),
        Obx(
          () => Text(controller.recoveredTotal.value.toString(),
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        )
      ],
    );
  }

  _totalDeaths() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Total death'),
        SizedBox(
          height: 5,
        ),
        Obx(
          () => Text(
            controller.deathTotal.value.toString(),
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        )
      ],
    );
  }

  Map<String, double> _showChartData() {
    Map<String, double> data = Map();
    data.putIfAbsent("Total Confirmed", () => controller.confirmedTotal.value);
    data.putIfAbsent("Total death", () => controller.deathTotal.value);
    data.putIfAbsent("Total recovered", () => controller.recoveredTotal.value);
    return data;
  }
}
