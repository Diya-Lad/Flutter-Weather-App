import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:Weather/models/weather.dart';



class Loading1 extends StatefulWidget {
  const Loading1({Key key}) : super(key: key);

  @override
  State<Loading1> createState() => _Loading1State();
}

class _Loading1State extends State<Loading1> {
  String apiKey = "ad925d3c82ea62de52a5629723ee9faf";
  String apiKey2 = "73bc503675e54b71851180618221011";
  void startApp(String city) async {
    Response response = await get("http://api.openweathermap.org/data/2.5/weather?q=$city&appid=e34a5eb0b4c5ff748fdf9219a63d224e");
    Response response2 = await get(
        "http://api.weatherapi.com/v1/forecast.json?key=$apiKey2&q=$city&days=5&aqi=no&alerts=no"
    );
    Map data = jsonDecode(response.body);
    Map data2 = jsonDecode(response2.body);

    // condition: json['current']['weather'][0]['main'],
    // temperature: (json['current']['temp']).round(),
    // feelsLike: (json['current']['feels_like']).round(),
    // visibility: (json['current']['visibility'] / 1000).round(),
    // pressure: (json['current']['pressure']),
    // humidity: json['current']['humidity'].toString(),
    // windSpeed: (json['current']['wind_speed'] * 3.6),
    // // country: json['sys']['country'],
    // name: json['timezone'],
    // icon: json['current']['weather'][0]['icon']
    print("Hello world");
    print(data['visibility']);

    Map temp_data = data['main'];
    Map wind = data['wind'];
    num temperature = temp_data['temp'] - 273.15;
    String humidity = temp_data['humidity'].toString();
    num windSpeed = wind['speed']/0.27777777777778;
    List weather_data = data['weather'];
    Map weather_main_data = weather_data[0];
    String condition = weather_main_data['main'];
    String icon = weather_main_data['icon'].toString();
    num feelsLike = temp_data['feels_like'];
    num pressure = temp_data['pressure'];
    // num visibility = temp_data['visibility'];
    // String name = data['timezone'];
    print(icon);
    print(data);

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/weather1',arguments: {
        "temperature" : temperature,
        "humidity" : humidity,
        "windSpeed" : windSpeed,
        "condition" : condition,
        "icon" : icon,
        "feelsLike" : feelsLike,
        "pressure" : pressure,
        "name" : city,
        "visibility" : (data['visibility']/1000).round(),
        "weatherData2": WeatherData2.fromJson(data2),
        // "name" : name
      } );
    });
  }

  @override
  Widget build(BuildContext context) {
    String city;
    Map search = ModalRoute.of(context).settings.arguments as Map;
    if (search?.isNotEmpty ?? false) {
      city = search['searchText'];
    }
    startApp(city);
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [LottieBuilder.asset("assets/loading.json")],
        ));
  }
}