
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import '../app_constant/constant.dart';
class Utility{
  static createFileAndCache(var responseJson) async {
    print('createFileAndCache() called ${responseJson}');
    var cacheDir = await getTemporaryDirectory();
      if (await File(cacheDir.path + "/" + Constant.cacheFileName).exists()){}
      else{
         print('else() ');
        var tempDir = await getTemporaryDirectory();
        File file = new File(tempDir.path + "/" + Constant.cacheFileName);
        file.writeAsString(responseJson, flush: true, mode: FileMode.write);
      }
  }
}