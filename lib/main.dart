import 'package:Weather/screens/Loading1.dart';
import 'package:Weather/screens/fav.dart';
import 'package:Weather/screens/login.dart';
import 'package:Weather/screens/registratoin_screen.dart';
import 'package:flutter/material.dart';
import 'package:Weather/screens/Loading.dart';
import 'package:Weather/screens/Weather.dart';
import 'package:Weather/screens/Weather1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/register',
        routes: {
          '/register' : (context) => MyRegister(),
          '/login' : (context) => MyLogin(),
          '/loading': (context) => Loading(),
          '/weather': (context) => Weather(),
          '/loading1' : (context) => Loading1(),
          '/weather1' : (context) => Weather1(),
          // '/fav': (context) => fav()
        });
  }
}
