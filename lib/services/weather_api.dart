import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart' as constants;

class WeatherApi {
  late var currentLocation;
  late LocationPermission permission;

  getCurrentCityWeather() async {
    Geolocator.openLocationSettings();
    permission = await Geolocator.requestPermission();
    currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    if (currentLocation != null) {
      var client = http.Client();
      var uri =
          '${constants.domain}lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=${constants.apiKey}';
      var url = Uri.parse(uri);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(response.statusCode);
      }
    } else {
      throw Exception('Data Not Found');
    }
  }

  Future<Map<String, dynamic>> getWeatherData(String city) async {
    final response =
        await http.get(Uri.parse('${constants.domain}q=$city&appid=${constants.apiKey}'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data!');
    }
  }
}
