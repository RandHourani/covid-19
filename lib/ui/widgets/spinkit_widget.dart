import 'package:country_picker/country_picker.dart';
import 'package:covid19/configrations/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SpinKitWidget extends StatelessWidget {
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: AppColors.mainColor,
      size: 50.0,
    );
  }
}
