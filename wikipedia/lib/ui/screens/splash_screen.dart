import 'package:flutter/material.dart';
import '../../ui/styles/my_app_theme.dart';
import '../../ui/routers/my_router.dart';
import '../../ui/styles/images.dart';
import 'dart:async';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationToWelcomeScreen);
  }

  void navigationToWelcomeScreen() {
    Get.toNamed(MyRouter.homeScreen);
  }

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyAppTheme.textWhite,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          Images.wikipedia_icon,
          fit: BoxFit.fill,
          height: screenSize.height * 0.20,
          width: screenSize.width * 0.35,
        ),
      ),
    );
  }
}
