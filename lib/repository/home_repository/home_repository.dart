import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../data/network/network_api_services.dart';
import '../../models/home/weather_model.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<WeatherData> getWeatherApi(String city) async {
    await dotenv.load();
    dynamic response = await _apiService.getApi(
        "${dotenv.env['BASE_URL']}/data/2.5/weather?q=$city&units=metric&appid=${dotenv.env['API_KEY']}");
    return WeatherData.fromJson(response);
  }
}
