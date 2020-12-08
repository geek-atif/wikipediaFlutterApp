import 'package:flutter/material.dart';
import '../../ui/styles/fonts.dart';
import '../../model/wikipedia_response.dart';
import '../routers/my_router.dart';
import '../../ui/styles/images.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

class ListItem extends StatelessWidget {
  final Size screenSize;
  final Pages page;
  ListItem({Key key, this.page, this.screenSize}) : super(key: key);
  openWikipediaScreen() {
    (Connectivity().checkConnectivity()).then((connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        Get.snackbar("No Internet", "Please connect to internet");
      } else {
        Get.toNamed(MyRouter.wikipediaScreen, arguments: page.title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              page.thumbnail == null
                  ? Image.asset(
                      Images.wikipedia_icon,
                      height: screenSize.height * 0.12,
                      width: screenSize.width * 0.12,
                    )
                  : FadeInImage.assetNetwork(
                      placeholder: Images.wikipedia_icon,
                      image: page.thumbnail.source,
                      height: screenSize.height * 0.12,
                      width: screenSize.width * 0.12,
                    ),
              SizedBox(
                width: screenSize.width * 0.1,
              ),
              Flexible(
                child: Text(
                  page.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: Fonts.biotifSemiBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
