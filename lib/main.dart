import 'package:flutter/material.dart';


void main(List<String> args) {
  runApp(WeatherApp());
}


class WeatherApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

 
    return MaterialApp(
      title: 'Weather App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: Center(child: Text('Text')),
        ),
    );
  }

}