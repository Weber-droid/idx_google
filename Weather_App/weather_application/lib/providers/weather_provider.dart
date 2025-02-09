import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import 'package:geolocator/geolocator.dart';

class WeatherProvider with ChangeNotifier {
  String _cityName = '';
  Map<String, dynamic>? _weatherData;
  List<dynamic>? _forecastData;

  String get cityName => _cityName;
  Map<String, dynamic>? get weatherData => _weatherData;
  List<dynamic>? get forecastData => _forecastData;

  final WeatherService _weatherService = WeatherService();

  void updateCityName(String city) async {
    _cityName = city;
    notifyListeners();

    try {
      _weatherData = await _weatherService.getWeather(city);
      _forecastData = await _weatherService.get5DayForecast(city);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  // Future<void> fetchWeatherByLocation() async {
  //   try {
  //     // Get user's current location
  //     Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high,
  //     );

  //     // Fetch weather and forecast data using latitude and longitude
  //     _weatherData = await _weatherService.getWeatherByLocation(
  //       position.latitude,
  //       position.longitude,
  //     );
  //     _forecastData = await _weatherService.get5DayForecastByLocation(
  //       position.latitude,
  //       position.longitude,
  //     );
  //     notifyListeners();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> fetchWeatherByLocation() async {
  try {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check and request location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    // Get user's current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Fetch weather and forecast data using latitude and longitude
    _weatherData = await _weatherService.getWeatherByLocation(
      position.latitude,
      position.longitude,
    );
    _forecastData = await _weatherService.get5DayForecastByLocation(
      position.latitude,
      position.longitude,
    );
    notifyListeners();
  } catch (e) {
    print('Error fetching location: $e');
  }
}
}

