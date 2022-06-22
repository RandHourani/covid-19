import 'package:covid19/ui/home/home_controller.dart';
import 'package:covid19/ui/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../configrations/app_colors.dart';

class SafteyScreen extends GetView<HomeController> {


  List<String> imgs = [
    "assets/images/mask.png",
    "assets/images/vaccination.png",
    "assets/images/clean.png"
  ];
  List<String> titels = [
    "Wear a mask when you go outside of your home ",
    "Take the vaccination to protect yourself from infecation",
    "By maintaining social distance you can kep safe"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(""),),
      body: Column(
        children: [
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 1.2,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 12),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 1.8,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width/1.5,
                      child: Image.asset(
                        imgs[index],
                        fit: BoxFit.contain,
                        width: 60,height: 60,
                      ),
                    ),

                    Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Text(
                          titels[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                        )),
                  ],
                );
              },
              itemCount: imgs.length,
              pagination: const SwiperPagination(),
              control: const SwiperControl(),
              autoplay: true,
              autoplayDelay: 3000,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.mainColor),
                  borderRadius: BorderRadius.circular(10)),
              color: AppColors.dark,
              elevation: 3,
              onPressed: () {
                Get.to(()=>HomeScreen());

              },
              child: Text("Home",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          )

        ],
      )
    );
  }
// Future<void>
}
