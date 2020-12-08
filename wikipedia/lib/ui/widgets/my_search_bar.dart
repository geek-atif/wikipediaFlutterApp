import 'package:flutter/material.dart';
import '../../app_constant/constant.dart';
import '../../controller/home_controller.dart';
import '../../ui/styles/my_app_theme.dart';
import '../../ui/styles/my_strings.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

class MySearchBar extends StatelessWidget {
  final Size screenSize;
  MySearchBar({this.screenSize});

  getDataFromServer(String querySearch) {
    print('getDataFromServer() querySearch ${querySearch}');
    (Connectivity().checkConnectivity()).then((connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        Get.snackbar("No Internet", "Please connect to internet");
        return;
      }

      if (querySearch.isNullOrBlank) {
        Get.find<HomeController>().defaultQuery.value = Constant.defaultQuery;
        Get.find<HomeController>().getWikipediaData();
        return;
      }

      Get.find<HomeController>().defaultQuery.value = querySearch;
      Get.find<HomeController>().getWikipediaData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, top: 10),
      height: screenSize.height * 0.08,
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
            color: MyAppTheme.boxShadow,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.search,
                  color: MyAppTheme.black,
                  size: 25,
                ),
              ),
              Container(
                width: screenSize.width * 0.7,
                margin: EdgeInsets.only(left: 8),
                color: Colors.white,
                child: TextField(
                  onChanged: (value) {
                    getDataFromServer(value);
                  },
                  onSubmitted: (value) {
                    getDataFromServer(value);
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: MyStrings.search),
                ),
              ),
            ],
          ),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(64),
          ),
        ),
      ),
    );
  }
}
