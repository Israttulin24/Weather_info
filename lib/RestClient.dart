import 'dart:convert';
import 'package:http/http.dart' as http;
import 'WeatherModel.dart';

class WeatherApiClient {
  Future<Weather>? GetWeatherInfoRequest(String? location)async{
    var URL = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=b41747b9e0d6bf43400863ea18e4c226&units=metric");
    var response = await http.get(URL);

    var body = json.decode(response.body);


    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);

  }
}
