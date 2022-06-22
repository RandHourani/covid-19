import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../configrations/app_colors.dart';
import '../home/home_controller.dart';

class DatePickerWidget extends StatelessWidget{

  HomeController _homeController = Get.put(HomeController());
  late String _startDate, _endDate;
  final DateRangePickerController _controller = DateRangePickerController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(height: MediaQuery.of(context).size.height/1.2,
            child: Card(
                child: SfDateRangePicker(
                  rangeSelectionColor: AppColors.mainColor.withOpacity(0.3),
                  selectionColor: AppColors.mainColor,
                  todayHighlightColor: AppColors.mainColor,
                  startRangeSelectionColor: AppColors.mainColor,
                  endRangeSelectionColor: AppColors.mainColor,
                  controller:_controller ,
                  view: DateRangePickerView.month,
                  selectionMode: DateRangePickerSelectionMode.range,
                  onSelectionChanged: (DateRangePickerSelectionChangedArgs args){
                    _homeController.selectionChanged(args);

                  },

                )),
          ),
          Container(
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
                Get.back();

                _homeController.filterCases(context);
              },
              child: Text("Filter",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
        ],
      ),
    );  }
}