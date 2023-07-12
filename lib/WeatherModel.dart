import 'package:flutter/physics.dart';
import 'RestClient.dart';

class Weather{
  String? cityName;
  double? temp;
  double? mx_Temp;
  double? mn_Temp;
  String? weather;
  var icn;



  Weather (
      { this.cityName,
        this.temp,
        this.mx_Temp,
        this.mn_Temp,
        this.weather,
        this.icn,
        });

  Weather.fromJson(Map<String, dynamic> json){
    cityName = json["name"];
    temp = json["main"]["temp"];
    mx_Temp = json["main"]["temp_max"];
    mn_Temp = json["main"]["temp_min"];
    weather = json["weather"][0]['main'];
    icn = json["weather"][0]['icon'];
  }






}

