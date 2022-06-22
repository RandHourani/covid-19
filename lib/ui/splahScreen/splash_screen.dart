import 'package:covid19/configrations/app_colors.dart';
import 'package:covid19/ui/splahScreen/splah_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatelessWidget {
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: null /* add child content here */,
            ),
            // Image.asset(
            //   "assets/images/bg.png",

            // ),
            Image.asset(
              "assets/images/splash.png",
              width: MediaQuery.of(context).size.height / 3,
              height: MediaQuery.of(context).size.height / 3,
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
              child: Text(
                "Covid-19 Tracking",
                style: TextStyle(fontSize: 30, color: AppColors.customGrey,fontWeight: FontWeight.w700),
              ),

            ),
            SpinKitThreeBounce(
              color: AppColors.mainColor,
              size: 30.0,

            )
          ],
        ),

    );
  }
}
