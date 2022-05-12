import 'countryInfo_model.dart';

class Category {
  final int act;
  final String      country,flag;
  CountryInfo_model Countryinfo;

  Category({this.act, this.country, this.flag, this.Countryinfo});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      act: json["active"] as int,
      country: json["country"],
      flag: json["continent"],
      Countryinfo: CountryInfo_model.fromJson(json['countryInfo'])
    );
  }
}


