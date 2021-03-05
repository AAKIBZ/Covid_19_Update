import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_getx_by_me/widgets/countrydetailswidget.dart';

class CountryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Details'),
      ),
      body: CountryDetailsWidget().barChart(),
    );
  }
}
