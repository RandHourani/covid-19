import 'package:country_picker/country_picker.dart';
import 'package:covid19/configrations/app_colors.dart';
import 'package:covid19/ui/home/cases_container_widget.dart';
import 'package:covid19/ui/home/stay_safety.dart';
import 'package:covid19/ui/widgets/datePicker.dart';
import 'package:covid19/ui/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../splahScreen/splah_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeController _homeController = Get.put(HomeController());
  SplashController _splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Covid-19",
              style: TextStyle(color: Colors.black),
            ),
            leading: InkWell(
              onTap: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return DatePickerWidget();
                  },
                );
              },
              child: Icon(
                Icons.filter_alt,
                color: Colors.black,
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  _homeController.updateUserCountry(
                      _splashController.userCountry.value.first.country
                          .toString(),
                      _splashController.userCountry.value.first.isoCountryCode
                          .toString());
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.black,
                ),
              ),
            ]),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CasesContainer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColors.dark,
                            // border: Border.all(
                            //   color:Colors.red ,
                            // ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        width: MediaQuery.of(context).size.width / 2.4,
                        margin: EdgeInsets.only(
                            top: 8, bottom: 20, left: 10, right: 10),
                        child: Obx(() {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/sick.png",
                                width: 60,
                                height: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Active Cases",
                                  style: TextStyle(
                                      color: AppColors.mainColor, fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    _homeController
                                            .totalOfCases!.value.isNotEmpty
                                        ? _homeController.isFiltered.value
                                            ? (_homeController.totalOfCases!
                                                        .value.last.active!
                                                        .toInt() -
                                                    _homeController
                                                        .totalOfCases!
                                                        .value
                                                        .first
                                                        .active!
                                                        .toInt())
                                                .toString()
                                            : (_homeController.totalOfCases!
                                                        .value.last.active!
                                                        .toInt() -
                                                    _homeController
                                                        .totalOfCases!
                                                        .value[_homeController
                                                                .totalOfCases!
                                                                .value
                                                                .length -
                                                            2]
                                                        .active!
                                                        .toInt())
                                                .toString()
                                        : "0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700)),
                              )
                            ],
                          );
                        }),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColors.dark,
                            // border: Border.all(
                            //   color:Colors.red ,
                            // ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        width: MediaQuery.of(context).size.width / 2.4,
                        margin: EdgeInsets.only(
                            top: 8, bottom: 20, left: 10, right: 10),
                        child: Obx(() {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/dead.png",
                                width: 60,
                                height: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Death Cases",
                                  style: TextStyle(
                                      color: AppColors.mainColor, fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    _homeController
                                            .totalOfCases!.value.isNotEmpty
                                        ? _homeController.isFiltered.value
                                            ? (_homeController.totalOfCases!
                                                        .value.last.deaths!
                                                        .toInt() -
                                                    _homeController
                                                        .totalOfCases!
                                                        .value
                                                        .first
                                                        .deaths!
                                                        .toInt())
                                                .toString()
                                            : (_homeController.totalOfCases!
                                                        .value.last.deaths!
                                                        .toInt() -
                                                    _homeController
                                                        .totalOfCases!
                                                        .value[_homeController
                                                                .totalOfCases!
                                                                .value
                                                                .length -
                                                            2]
                                                        .deaths!
                                                        .toInt())
                                                .toString()
                                        : "0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700)),
                              )
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/safe_bg.png"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, left: 20, bottom: 12),
                          child: Text(
                            "Stay Healtthy and Safety ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2,
                          margin: EdgeInsets.only(bottom: 20, top: 8),
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius.circular(10)),
                            color: AppColors.dark,
                            elevation: 3,
                            onPressed: () {
                              Get.to(() => SafteyScreen());
                            },
                            child: Text(
                              "More Details",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }
}
