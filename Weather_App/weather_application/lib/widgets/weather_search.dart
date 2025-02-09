import 'package:flutter/material.dart';

class WeatherSearch extends StatelessWidget {
  const WeatherSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Enter city name',
          border: OutlineInputBorder(),
        ),
        onSubmitted: (value) {
          // Implement search functionality here
        },
      ),
    );
  }
}