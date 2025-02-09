import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = 'd69881bea4b0af18b5c3c20e324151da';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<Map<String, dynamic>> getWeather(String city) async {
    final response = await http.get(
      Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<dynamic>> get5DayForecast(String city) async {
    final response = await http.get(
      Uri.parse('$baseUrl/forecast?q=$city&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['list'];
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

  Future<Map<String, dynamic>> getWeatherByLocation(double lat, double lon) async {
    final response = await http.get(
      Uri.parse('$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<dynamic>> get5DayForecastByLocation(double lat, double lon) async {
    final response = await http.get(
      Uri.parse('$baseUrl/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['list'];
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}