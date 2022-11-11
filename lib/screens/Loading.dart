import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:Weather/models/weather.dart';
import 'package:simple_location_picker/simple_location_result.dart';

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String apiKey = "ad925d3c82ea62de52a5629723ee9faf";
  String apiKey2 = "73bc503675e54b71851180618221011";
  SimpleLocationResult arguments;
  getData({lat, lon}) async {
    String latitude = lat == null ? "31.5925" : lat.toString();
    String longitude = lon == null ? "74.3095" : lon.toString();

    print("in getData");
    Response response = await get(
        "https://api.openweathermap.org/data/3.0/onecall?lat=$latitude&lon=$longitude&appid=$apiKey"
    );
    print("After response");
    print(response.body);
    Response response2 = await get(
        "http://api.weatherapi.com/v1/forecast.json?key=$apiKey2&q=Nadiad&days=5&aqi=no&alerts=no"
    );
    print(response2);
    Map data = jsonDecode(response.body);
    Map data2 = jsonDecode(response2.body);
    print("After response2");
    print(WeatherData2.fromJson(data2).future_forecast);
    // print(WeatherData2.fromJson(data2));
    Navigator.pushReplacementNamed(context, "/weather",
        arguments: {
          "weatherData": WeatherData.fromJson(data),
          "selectedLocation": arguments,
          "weatherData2": WeatherData2.fromJson(data2),
        });
  }

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context).settings.arguments;
    Future.delayed(Duration(seconds: 1), () => {
      arguments != null ? getData(lat: arguments.latitude, lon: arguments.longitude) :  getData()
    });
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [LottieBuilder.asset("assets/loading.json")],
        ));
  }
}
