import 'dart:convert';
import 'package:country_provider/Model/countryModel.dart';
import 'package:country_provider/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Country with ChangeNotifier {
  List<CountryModel> _countryList = List<CountryModel>();

  List<CountryModel> get countryList => _countryList;

  void getData() async {
    http.Response response = await http.get(Constants.apiEndpoint);
    var data = jsonDecode(response.body);
    _countryList = List<CountryModel>();
    for (var country in data) {
      _countryList.add(CountryModel.fromMap(country));
    }
    notifyListeners();
  }

  void deleteCountry(int index) {
    if (countryList.length >= index) {
      countryList.removeAt(index);
    }
    notifyListeners();
  }
}
