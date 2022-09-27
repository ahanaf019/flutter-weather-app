import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

Future<Map<dynamic, dynamic>> getWeather(double lat, double lon) async {
  var key = await File('resources/key.txt').readAsLines();
  
  Map<String, String> queryParams = {
    'lat': lat.toString(),
    'lon': lon.toString(),
    'appid': key[0]
  };

  Uri requestUrl = Uri.https('api.openweathermap.org', '/data/2.5/forecast', queryParams);
  var response = await http.get(requestUrl);


  Map responsData = jsonDecode(response.body);
  return responsData;
}


void main(List<String> args) async{
    var weather = await getWeather(22.2, 44.2);
    print(weather);

}