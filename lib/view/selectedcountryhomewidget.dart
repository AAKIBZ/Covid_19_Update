import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_getx_by_me/controller/globalcontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

final GlobalController _globalController = Get.find();

Widget buildParticularCountry(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(20.0),
    child: _detailSelectedCountry(),
  );
}

Widget _detailSelectedCountry() {
  return Material(
    elevation: 5,
    child: Container(
      height: Get.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[600],
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _confirmedItem(),
          _dividerItem(),
          _recoveredItem(),
          _dividerItem(),
          _deathsItem(),
        ],
      ),
    ),
  );
}

Widget _confirmedItem() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text("Confirmed", style: TextStyle(fontSize: 16)),
        Padding(padding: EdgeInsets.only(top: 5)),
        Obx(
          () => _totalActiveCasesOfCountryDetails(
              _globalController.confirmedCountry.value.toString(),
              Colors.white),
        )
      ],
    ),
  );
}

Widget _recoveredItem() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text("Recovered", style: TextStyle(fontSize: 16)),
        Padding(padding: EdgeInsets.only(top: 5)),
        Obx(
          () => _totalActiveCasesOfCountryDetails(
              _globalController.recoveredCountry.value.toString(),
              Colors.greenAccent),
        )
      ],
    ),
  );
}

Widget _deathsItem() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text("Deaths", style: TextStyle(fontSize: 16)),
        Padding(padding: EdgeInsets.only(top: 5)),
        Obx(() => _totalActiveCasesOfCountryDetails(
            _globalController.deathsCountry.value.toString(), Colors.redAccent))
      ],
    ),
  );
}

Widget _totalActiveCasesOfCountryDetails(String total, Color textColor) {
  return Text(
    total,
    style: TextStyle(
      color: textColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _dividerItem() {
  return Container(
    color: Colors.black45,
    width: 1.0,
    height: Get.height,
  );
}
