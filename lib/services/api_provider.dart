import 'dart:convert';

import 'package:covid19/services/server_url.dart';
import 'package:covid19/ui/widgets/spinkit_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../models/base_model.dart';
import '../utils/util.dart';

class ApiProvider {
  Client client = Client();

//controller to get country code
  Future<List<BaseModel>?> getTotalOfCase(
  String countryName) async {

    var response = await client.get(
        Uri.parse(
            ServerUrl.DETALS_CASES + countryName.trim().replaceAll(' ', "%20")),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      Iterable? l = json.decode(response.body);
      List<BaseModel>? total =
          List<BaseModel>.from(l!.map((model) => BaseModel.fromJson(model)));
      return total;
      // return BaseModel.fromJson(jsonDecode(response.body));
    } else {
      Utils.getSnackBar("Something wrong happen please try again");
    }
  }

  Future<List<BaseModel>?> getDomainOfCase(BuildContext context,
      String fromDate, String toDate, String countryName) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return SpinKitWidget();
      },
    );

    var response = await client.get(
        Uri.parse(ServerUrl.DETALS_CASES +
            countryName.trim().replaceAll(' ', "-") +
            "?from=" +
            fromDate +
            "&to=" +
            toDate),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      Iterable? l = json.decode(response.body);
      List<BaseModel>? total =
          List<BaseModel>.from(l!.map((model) => BaseModel.fromJson(model)));
      Get.back();

      return total;
    } else {
      Utils.getSnackBar("Something wrong happen please try again");
    }
  }
}
