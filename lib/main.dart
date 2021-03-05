import 'package:flutter/material.dart';
import 'package:flutter_app_getx_by_me/view/details.dart';
import 'package:flutter_app_getx_by_me/view/homescreen.dart';
import 'package:get/get.dart';

import 'controller/binding/controllerbindings.dart';

void main() async {
  ControllerBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/DetailsPage',
          page: () => CountryDetails(),
        )
      ],
      theme: ThemeData.dark(),
    );
  }
}
