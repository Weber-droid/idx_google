// lib/models/weather_model.dart
class WeatherModel {
  final String cityName;
  final double temperature;
  final String condition;
  final String icon;
  final List<DailyForecast> dailyForecast;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.icon,
    required this.dailyForecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final dailyForecast = (json['daily'] as List)
        .map((e) => DailyForecast.fromJson(e))
        .toList();

    return WeatherModel(
      cityName: json['timezone'],
      temperature: json['current']['temp'],
      condition: json['current']['weather'][0]['main'],
      icon: json['current']['weather'][0]['icon'],
      dailyForecast: dailyForecast,
    );
  }
}

class DailyForecast {
  final DateTime date;
  final double temperature;
  final String condition;
  final String icon;

  DailyForecast({
    required this.date,
    required this.temperature,
    required this.condition,
    required this.icon,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      temperature: json['temp']['day'],
      condition: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
    );
  }
}