class CountryModel {
  String name;
  String capital;
  String region;
  String subregion;
  String flagURL;

  CountryModel({
    this.name,
    this.capital,
    this.region,
    this.subregion,
    this.flagURL,
  });

  CountryModel.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.capital = map['captial'];
    this.region = map['region'];
    this.subregion = map['subregion'];
    this.flagURL = map['flag'];
  }
}
