import 'package:flutter/material.dart';
import 'package:weather_app/weather.dart';


void main(List<String> args) {
  runApp(WeatherApp());
}


class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});
  
  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = getWeather(24.37, 88.60);
    print(futureWeather);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: Center(
          child: FutureBuilder<Weather>(
            future: futureWeather,
            builder: (context, snapshot) {
              print(snapshot.hasData);
              if (snapshot.hasData) {

                var stringText = '''
          Location: 
            Rajshahi.
            Lat=${snapshot.data!.lat}, Lon=${snapshot.data!.lon}
          
          Weather:
                Temperature     : ${snapshot.data!.temp} °C
                Feels Like          : ${snapshot.data!.feelsLike} °C
                Min                     : ${snapshot.data!.tempMin} °C
                Max                    : ${snapshot.data!.tempMax} °C
                Humidity            : ${snapshot.data!.humidity}%
                Pressure            : ${snapshot.data!.pressure} hPa
                Wind Speed       : ${snapshot.data!.windSpeed} meter/sec
                ''';
                
                return Text(stringText);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}