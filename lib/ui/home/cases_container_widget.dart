import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../configrations/app_colors.dart';
import 'home_controller.dart';

class CasesContainer extends StatelessWidget{
  HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
   return Container(
     height: MediaQuery.of(context).size.height / 3.5,
     width: MediaQuery.of(context).size.width,
     margin: EdgeInsets.all(12),
     padding: EdgeInsets.all(12),
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
             offset: Offset(0, 3), // changes position of shadow
           ),
         ],
         borderRadius: BorderRadius.all(Radius.circular(20))),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Container(
           alignment: Alignment.center,
           width: MediaQuery.of(context).size.width,
           margin: EdgeInsets.only(bottom: 20),
           padding: EdgeInsets.only(left: 20, right: 20),
           child: RaisedButton(
             shape: RoundedRectangleBorder(
                 side: BorderSide(color: AppColors.mainColor),
                 borderRadius: BorderRadius.circular(10)),
             color: AppColors.dark,
             elevation: 3,
             onPressed: () {
               showCountryPicker(
                 context: context,
                 showPhoneCode: true,

                 // optional. Shows phone code before the country name.
                 onSelect: (Country country) {
                   _homeController.updateUserCountry(
                       country.name, country.countryCode);
                 },
               );
             },
             child: Obx(() {
               if(_homeController.userCountry.value.countryName!=null){
               return Row(
                 mainAxisAlignment:
                 MainAxisAlignment.spaceAround,
                 children: [
                   Image.asset(
                     'icons/flags/png/' +
                         _homeController
                             .userCountry.value.countryCode
                             .toString()
                             .toLowerCase() +
                         ".png",
                     package: 'country_icons',
                     width: 60,
                     height: 60,
                   ),
                   Text(
                     _homeController
                         .userCountry.value.countryName
                         .toString(),
                     style: TextStyle(color: Colors.white),
                   )
                 ],
               );}
               else
                 {return Row(
                   mainAxisAlignment:
                   MainAxisAlignment.spaceAround,
                   children: [
                     Container(
                       color: Colors.white,
                       width: 60,
                       height: 60,
                     ),
                     Text(

                           "---",
                       style: TextStyle(color: Colors.white),
                     )
                   ],
                 );}
             }),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(
             "Today Cases",
             style: TextStyle(
                 color: AppColors.mainColor,
                 fontSize: 16,
                 fontWeight: FontWeight.bold),
           ),
         ),
         Obx(() {
           if (_homeController.totalOfCases!.value.isNotEmpty) {
             return Text(
               _homeController.isFiltered.value?(_homeController.totalOfCases!.value.last.active!
                   .toInt() -
                   _homeController
                       .totalOfCases!
                       .value.first
                       .active!
                       .toInt()).toString():(_homeController.totalOfCases!.value.last.active!
                   .toInt() -
                   _homeController
                       .totalOfCases!
                       .value[_homeController
                       .totalOfCases!.value.length -
                       2]
                       .active!
                       .toInt())
                   .toString(),
               style: TextStyle(
                   fontSize: 40,
                   fontWeight: FontWeight.bold,
                   color: Colors.white),
             );
           } else {
             return Shimmer.fromColors(
               baseColor: Colors.grey,
               highlightColor: Colors.white30,
               child: Text(
                 '0',
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 40.0,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             );
           }
         }),
       ],
     ),
   );
  }

}