import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              weatherProvider.fetchWeatherByLocation();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                weatherProvider.updateCityName(value);
              },
            ),
          ),
          const SizedBox(height: 20),
          if (weatherProvider.weatherData != null)
            Column(
              children: [
                Text('City: ${weatherProvider.weatherData!['name']}'),
                Text('Temperature: ${weatherProvider.weatherData!['main']['temp']}°C'),
                Text('Condition: ${weatherProvider.weatherData!['weather'][0]['main']}'),
                Image.network(
                  'https://openweathermap.org/img/wn/${weatherProvider.weatherData!['weather'][0]['icon']}@2x.png',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          const SizedBox(height: 20),
          if (weatherProvider.forecastData != null)
            Expanded(
              child: ListView.builder(
                itemCount: weatherProvider.forecastData!.length,
                itemBuilder: (context, index) {
                  final forecast = weatherProvider.forecastData![index];
                  return ListTile(
                    title: Text('${forecast['dt_txt']}'),
                    subtitle: Text('${forecast['main']['temp']}°C - ${forecast['weather'][0]['main']}'),
                    leading: Image.network(
                      'https://openweathermap.org/img/wn/${forecast['weather'][0]['icon']}@2x.png',
                      width: 50,
                      height: 50,
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}