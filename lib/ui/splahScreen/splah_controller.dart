import 'package:covid19/ui/home/home_controller.dart';
import 'package:covid19/ui/home/home_screen.dart';
import 'package:covid19/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../configrations/app_colors.dart';
import '../../configrations/app_constant.dart';

class SplashController extends GetxController {

  HomeController _homeController = Get.put(HomeController());


  RxList<Placemark> userCountry = <Placemark>[].obs;

  void delay() {
    Future.delayed(Duration(seconds: AppConstant.splashDelay), () {
      Get.to(() => HomeScreen());
    });
  }

  getUserLocation() async {
    await Utils.getUserLocation().then((value) =>
        userCountry.value=value);
    _homeController.updateUserCountry(userCountry.value.first.country.toString(),
        userCountry.value.first.isoCountryCode.toString());
  }


getSnackBar(String mess)
{ Get.snackbar(
  "".tr,
  "",
  borderRadius: 20,
  margin: EdgeInsets.all(15),
  padding: EdgeInsets.all(15),
  titleText: Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: Row(
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.white,
          size: 20,
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          mess,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  ),
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: AppColors.customRed,
);}
  @override
  void onInit() {
    getUserLocation();
    delay();

    super.onInit();
  }

}
