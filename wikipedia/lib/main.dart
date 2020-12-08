import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:get/get.dart';
import 'ui/routers/my_router.dart';
import 'ui/styles/my_app_theme.dart';

void main() {
  // runApp(DevicePreview(
  //   usePreferences: false,
  //   builder: (context) => MyApp(),
  // ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    services.SystemChrome.setPreferredOrientations([
      services.DeviceOrientation.portraitUp,
      services.DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      //locale: DevicePreview.of(context).locale,
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Wikipedia',
      theme: MyAppTheme.lightTheme,
      getPages: MyRouter.route,
    );
  }
}
