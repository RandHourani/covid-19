
import 'package:flutter/material.dart';

import '../models/base_model.dart';
import 'api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<List<BaseModel>?> getTotalOfCase(String countryName) async {
    return apiProvider.getTotalOfCase( countryName);
  }Future<List<BaseModel>?> getDomainOfCase(BuildContext context,String fromDate,String toDate,String countryName) async {
    return apiProvider.getDomainOfCase(context,fromDate, toDate,countryName);
  }




}
