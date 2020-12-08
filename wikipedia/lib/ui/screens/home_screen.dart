import '../../ui/widgets/my_search_bar.dart';
import '../../ui/widgets/result_list.dart';
import '../../ui/widgets/loading.dart';
import '../../controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MySearchBar(
                screenSize: screenSize,
              ),
              Obx(
                //Obx is very similar to GetX except 'lighter' so no parameters for init, dispose, etc
                () => Get.find<HomeController>().query.value == null
                    ? SizedBox()
                    : Expanded(
                        child: ResultList(
                            screenSize: screenSize,
                            querys: Get.find<HomeController>().query.value),
                      ),
              ),
              Obx(
                //Obx is very similar to GetX except 'lighter' so no parameters for init, dispose, etc
                () => Get.find<HomeController>().isLoading.value
                    ? Loading(
                        loadingMessage: '',
                      )
                    : SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
