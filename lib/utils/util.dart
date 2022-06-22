import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../configrations/app_colors.dart';

class Utils {
  static   Future<List<Placemark>> getUserLocation()  async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        getSnackBar('Location services are disabled.');
        await Geolocator.openLocationSettings();

        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          getSnackBar('Location permissions are denied');

          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
getSnackBar('Location permissions are permanently denied');
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      Position position =await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
         print(placeMarks[0].name.toString());
         print(placeMarks[0].country.toString());
      return placeMarks;
    }
static getSnackBar(String mess)
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
}
