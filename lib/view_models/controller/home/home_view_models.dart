import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quick_weather_app/utils/utils.dart';

import '../../../models/home/weather_model.dart';
import '../../../repository/home_repository/home_repository.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final weatherData = WeatherData().obs;

  final cityNameController = TextEditingController();

  //set weather data
  void setWeatherData(WeatherData value) => weatherData.value = value;

  //get weather data by default set my current city
  void getWeatherData() {
    _api
        .getWeatherApi(
            cityNameController.text.isEmpty ? "Dhaka" : cityNameController.text)
        .then((value) {
      setWeatherData(value);
    }).onError((error, stackTrace) {
      log("message $error $stackTrace");
      Utils.snackBar("Error", error.toString().replaceAll("Exception: ", ""));
    });
  }
}
