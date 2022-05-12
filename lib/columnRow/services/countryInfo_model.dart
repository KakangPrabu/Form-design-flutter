class CountryInfo_model {
  String flag, iso3;

  CountryInfo_model(this.flag, this.iso3);

  factory CountryInfo_model.fromJson(dynamic json) {
    return CountryInfo_model(json['flag'] as String, json['iso3'] as String);
  }

}