import 'package:covid19/ui/home/home_controller.dart';
import 'package:covid19/ui/splahScreen/splah_controller.dart';
import 'package:covid19/ui/splahScreen/splash_screen.dart';
import 'package:covid19/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);

  }
}
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Utils.getUserLocation();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      initialBinding: InitialBinding(),

home: SplashScreen(),
    );
  }
}


