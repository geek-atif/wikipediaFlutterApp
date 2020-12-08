import 'package:flutter/material.dart';
import '../../app_constant/constant.dart';
import '../../controller/home_controller.dart';
import '../../model/wikipedia_response.dart';
import 'list_item.dart';
import 'package:get/get.dart';

class ResultList extends StatefulWidget {
  final Size screenSize;
  final Query querys;
  ResultList({Key key, this.screenSize, this.querys}) : super(key: key);

  @override
  _ResultListState createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        var pageCount = Get.find<HomeController>().pageCount.value;
        Get.find<HomeController>().pageCount.value =
            pageCount + Constant.defaultQueryNumber;
        Get.find<HomeController>().getWikipediaData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 20),
      child: widget.querys.pages == null
          ? Text('')
          : ListView.builder(
              addAutomaticKeepAlives: true,
              controller: _controller,
              shrinkWrap: true,
              itemCount: widget.querys.pages.length,
              itemBuilder: (BuildContext context, int index) => ListItem(
                  screenSize: widget.screenSize,
                  page: widget.querys.pages[index]),
            ),
    );
  }
}
