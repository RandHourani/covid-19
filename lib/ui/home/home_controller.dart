import 'package:covid19/models/base_model.dart';
import 'package:covid19/models/contry_model.dart';
import 'package:covid19/services/repository.dart';
import 'package:covid19/ui/home/home_screen.dart';
import 'package:covid19/ui/splahScreen/splah_controller.dart';
import 'package:covid19/ui/splahScreen/splash_screen.dart';
import 'package:covid19/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../configrations/app_constant.dart';
import '../widgets/spinkit_widget.dart';

class HomeController extends GetxController {
  // SplashController _splashController = Get.put(SplashController());

  Rx<CountryModel> userCountry = CountryModel().obs;
  RxList<BaseModel>? totalOfCases = <BaseModel>[].obs;
  RxBool isFiltered = false.obs;
  Rx<String> startDate = "".obs;
  Rx<String> endDate = "".obs;

  Repository repository = Repository();

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    startDate.value =
        DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
    endDate.value = DateFormat('yyyy-MM-dd')
        .format(args.value.endDate ?? args.value.startDate)
        .toString();

  }

  getTotalOfCases() async {
    isFiltered.value=false;
    List<BaseModel>? res = await repository
        .getTotalOfCase(userCountry.value.countryName.toString());
    if (res != null) {
      totalOfCases!.value = res;

      update();
    }
    update();
  }
  filterCases(BuildContext context,) async {

    List<BaseModel>? res = await repository
        .getDomainOfCase(context,startDate.value,endDate.value,userCountry.value.countryName.toString());
    if (res != null) {
      isFiltered.value=true;
      totalOfCases!.value = res;
      update();
    }
    update();
  }

  updateUserCountry(String name, String code) {
    CountryModel country = CountryModel();
    country.countryName = name;
    country.countryCode = code;
    userCountry.value = country;
    getTotalOfCases();
  }

  @override
  void onInit() {
    isFiltered.value=false;
    super.onInit();
  }
}
