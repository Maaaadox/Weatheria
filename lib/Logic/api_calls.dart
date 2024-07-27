import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatheria/models/CurrentWeatherModel.dart';
import 'package:weatheria/models/ForecastWeatherModel.dart';

// first api call ,calls about current weather infos

Future<CurrentWeather> fetchWeather(String city) async {
  print(dotenv.env['APIKEY']);
  LocationPermission permission;
  final http.Response response;

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  Position location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);

  if (city != '') {
    response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=${dotenv.env['APIKEY']}&q=${city}&days=1&aqi=no&alerts=no'));
  } else {
    response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=${dotenv.env['APIKEY']}&q=${location.latitude},${location.longitude}&days=1&aqi=no&alerts=no'));
  }

  if (response.statusCode == 200) {
    return CurrentWeather.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load Weather');
  }
}

// second api call ,calls about next week weather infos
Future<ForecastWeather> fetchForecast(
    String? latitude, String? longitude) async {
  final http.Response response;

  Position location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);

  if (latitude != '' && longitude != '') {
    response = await http.get(Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=${latitude}&longitude=${longitude}&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto'));
  } else {
    response = await http.get(Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=${location.latitude}&longitude=${location.longitude}&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto'));
  }
  if (response.statusCode == 200) {
    return ForecastWeather.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Weather');
  }
}

List<List<dynamic>> csvTable = [];

loadAsset() async {
  final myData = await rootBundle.loadString("assets/worldcities.csv");
  csvTable = const CsvToListConverter().convert(myData);
}
