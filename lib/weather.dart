import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';


Future<Weather> getWeather(double lat, double lon) async {
  
  Map<String, String> queryParams = {
    'lat': lat.toString(),
    'lon': lon.toString(),
    'appid': 'da9bd6142b364f2df393f0487cd9193d',
    'units': 'metric'
  };

  Uri requestUrl = Uri.https('api.openweathermap.org', '/data/2.5/forecast', queryParams);
  var response = await http.get(requestUrl);


  Map<String, dynamic> responsData = jsonDecode(response.body);
  // responsData = responsData['list'][0]['main'];

  return Weather.fromJson(responsData);
}

class Weather {
  final String lat;
  final String lon;
  final String windSpeed;
  final String temp;
  final String feelsLike;
  final String tempMin;
  final String tempMax;
  final String pressure;
  final String humidity;

  const Weather({
    required this.lat,
    required this.lon,
    required this.windSpeed,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.pressure,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      lat : json['city']['coord']['lat'].toString(),
      lon : json['city']['coord']['lon'].toString(),
      windSpeed : json['list'][0]['wind']['speed'].toString(),
      temp: json['list'][0]['main']['temp'].toString().toString(),
      feelsLike: json['list'][0]['main']['feels_like'].toString(),
      tempMin: json['list'][0]['main']['temp_min'].toString(),
      tempMax: json['list'][0]['main']['temp_max'].toString(),
      humidity: json['list'][0]['main']['humidity'].toString(),
      pressure: json['list'][0]['main']['pressure'].toString(),

    );
  }
}


// void main(List<String> args) async{
//     var weather = await getWeather(22.2, 44.2);
//     print(weather.temp);
//     print(weather.windSpeed);

//     // print(weather); 

// }
