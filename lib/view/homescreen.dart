import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_getx_by_me/controller/globalcontroller.dart';
import 'package:flutter_app_getx_by_me/view/selectedcountryhomewidget.dart';
import 'package:flutter_app_getx_by_me/widgets/latest_details_widget.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
  final GlobalController globalController = Get.find<GlobalController>();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Virus Update...'),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _lastUpdatedOn(),
                SizedBox(
                  height: 5,
                ),
                _worldWideDetails(),
                LatestDetails().latestDetails(),
                SizedBox(
                  height: 10,
                ),
                countryDropDown(context),
                SizedBox(
                  height: 20,
                ),
                buildParticularCountry(context),
                SizedBox(
                  height: 20,
                ),
                _submitDetails(),
              ],
            ),
          ),
          globalController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                  value: 0.0,
                ))
              : CircularProgressIndicator(
                  value: 0.8,
                )
        ],
      ),
    );
  }

  _lastUpdatedOn() {
    return Container(
      padding: EdgeInsets.only(left: 16),
      child: Text("Last Updated On : ${globalController.lastUpdate.value}"),
    );
  }

  _worldWideDetails() {
    return Container(
      padding: EdgeInsets.only(left: 16),
      child: Text(
          'Note : These Are World Wide Covid 19 details . To check The Details Of a Particular Country  Select the Country from the Below options .'),
    );
  }

  countryDropDown(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        width: Get.width * 0.88,
        child: Obx(
          () => DropdownButton(
            hint: Text(
              "Choose Country",
              style: TextStyle(color: Colors.white),
            ),
            value: globalController.selectedCountry.value,
            elevation: 16,
            isExpanded: true,
            dropdownColor: Colors.grey.withOpacity(0.9),
            autofocus: true,
            underline: Container(),
            items: globalController.countries.value
                .map(
                  (val) => DropdownMenuItem(
                    value: val.iso3 == null ? "" : val.iso3.toString(),
                    child: Text(
                      val.name.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              print("cek value $value");
              if (value == "") {
                Get.snackbar("Error", "Data is empty");
              } else {
                globalController.selectedCountry.value = value;
                print(
                    "New Value AAKIB : ${globalController.selectedCountry.value}");
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _submitDetails() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.green),
        padding: EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
        child: GestureDetector(
            onTap: () {
              Get.toNamed('/DetailsPage');
            },
            child: Text('See Details')),
      ),
    );
  }
}
