class CountryModel {
  String? countryName;
  String? countryCode;

  CountryModel({this.countryName, this.countryCode});

  CountryModel.fromJson(Map<String, dynamic> json) {
    countryName = json['countryName'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryName'] = this.countryName;
    data['countryCode'] = this.countryCode;
    return data;
  }
}
