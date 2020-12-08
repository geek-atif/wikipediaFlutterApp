
import '../../ui/screens/splash_screen.dart';
import '../../ui/screens/home_Screen.dart';
import '../../ui/screens/wikipedia_screen.dart';
import 'package:get/route_manager.dart';
class MyRouter {
  static var homeScreen = "/homeScreen";
  static var wikipediaScreen = "/wikipediaScreen";
  
  static var route = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: wikipediaScreen, page: () => WikipediaScreen()),
  ];
}
