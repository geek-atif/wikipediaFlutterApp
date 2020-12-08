import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../controller/home_controller.dart';
import '../../ui/styles/my_app_theme.dart';
import '../../ui/widgets/loading.dart';
import '../../app_constant/constant.dart';
import 'package:get/get.dart';

class WikipediaScreen extends StatefulWidget {
  WikipediaScreen({
    Key key,
  }) : super(key: key);

  @override
  _WikipediaScreenState createState() => _WikipediaScreenState();
}

class _WikipediaScreenState extends State<WikipediaScreen> {
  final HomeController _homeController = Get.put(HomeController());
  String pageTitle = "";
  @override
  void initState() {
    pageTitle = Get.arguments as String;
  }

  pageFinishedLoading() {
    _homeController.iswebViewLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyAppTheme.black,
        title: Text(pageTitle),
      ),
      body: Column(
        children: [
          Obx(
            //Obx is very similar to GetX except 'lighter' so no parameters for init, dispose, etc
            () => Get.find<HomeController>().iswebViewLoading.value
                ? Loading(
                    loadingMessage: '',
                  )
                : SizedBox(),
          ),
          Expanded(
            child: WebView(
                initialUrl: Constant.webView + pageTitle,
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: pageFinishedLoading()),
          )
        ],
      ),
    );
  }
}
