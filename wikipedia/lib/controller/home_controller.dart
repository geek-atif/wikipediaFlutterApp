import 'dart:io';
import 'dart:convert';
import '../app_constant/constant.dart';
import '../model/wikipedia_response.dart';
import '../api_base_helper/api_base_helper.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController {
  ApiBaseHelper _helper = ApiBaseHelper();
  var isLoading = false.obs;
  var iswebViewLoading = true.obs;
  var query = Query().obs;
  var pageCount = Constant.defaultQueryNumber.obs;
  var defaultQuery = Constant.defaultQuery.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getWikipediaData();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getWikipediaData() async {
    print(
        'getWikipediaData() called serachContent : ${defaultQuery.value} numberOfcontent : ${pageCount.value}');

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        getCacheData();
      } else {
        getDataFromAPI();
      }
    } catch (e, s) {
      print('e :  {$s}');
      Get.snackbar("Error", e.toString());
      isLoading.value = false;
    }
  }

  getDataFromAPI() async {
    isLoading.value = true;
    final response = await _helper
        .get("&gpssearch=${defaultQuery.value}&gpslimit=${pageCount.value}");
    WikipediaResponse wikipediaResponse = WikipediaResponse.fromJson(response);
    print(wikipediaResponse.query.pages.length);
    query.value = wikipediaResponse.query;
    isLoading.value = false;
  }

  getCacheData() async {
      print("getCacheData() called");
    var cacheDir = await getTemporaryDirectory();
    if (await File(cacheDir.path + "/" + Constant.cacheFileName).exists()) {
      print("Loading from cache");
      var jsonData = File(cacheDir.path + "/" + Constant.cacheFileName).readAsStringSync();
      WikipediaResponse wikipediaResponse = WikipediaResponse.fromJson(json.decode(jsonData));
      print(wikipediaResponse.query.pages.length);
      query.value = wikipediaResponse.query;
      return;
    }
    Get.snackbar("No Internet", "Please connect to internet");
  }
}
