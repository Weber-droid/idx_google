// lib/widgets/weather_forecast.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import 'weather_icon.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weather = weatherProvider.weather;

    if (weather == null) {
      return const Center(child: Text('Search for a city or use your location'));
    }

    return ListView.builder(
      itemCount: weather.dailyForecast.length,
      itemBuilder: (context, index) {
        final forecast = weather.dailyForecast[index];
        return ListTile(
          leading: WeatherIcon(iconUrl: forecast.icon),
          title: Text('${forecast.temperature}°C'),
          subtitle: Text(forecast.condition),
          trailing: Text('${forecast.date.day}/${forecast.date.month}'),
        );
      },
    );
  }
}