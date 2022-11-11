import 'package:flutter/material.dart';
import 'package:simple_location_picker/simple_location_picker_screen.dart';
import 'package:simple_location_picker/simple_location_result.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:Weather/models/weather.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Weather1 extends StatefulWidget {
  Weather1({Key key}) : super(key: key);

  @override
  _Weather1State createState() => _Weather1State();
}

class _Weather1State extends State<Weather1> {
  WeatherData weather;
  WeatherData2 weather2;
  SimpleLocationResult selectedLocation;


  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    Map info = ModalRoute.of(context).settings.arguments;
    weather2 = arguments['weatherData2'];
    print(info['temperature']);
    var visibility = (info['visibility']/1000);
    var img=new List(24);
    img[6] = "01d";
    img[7] = "01d";
    img[8] = "01d";
    img[9] = "01d";
    img[10] = "01d";
    img[11] = "01d";
    img[12] = "01d";
    img[13] = "01d";
    img[14] = "01d";
    img[15] = "01d";
    img[16] = "01d";
    img[17] = "01d";
    img[18] = "01d";
    img[19] = "01n";
    img[20] = "01n";
    img[21] = "01n";
    img[22] = "01n";
    img[23] = "01n";
    img[1] = "01n";
    img[2] = "01n";
    img[3] = "01n";
    img[4] = "01n";
    img[5] = "01n";
    img[0] = "01n";


    return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1));
            Navigator.pushReplacementNamed(context, '/loading',
                arguments: selectedLocation);
            return null;
          },
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: ListView(
                children: [
                  Container(
                    //Search Wala Container

                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if((searchController.text).replaceAll(" ", "") == ""){

                            }
                            else{
                              Navigator.pushReplacementNamed(context, "/loading1",arguments: {
                                "searchText" : searchController.text
                              });
                            }
                          },
                          child: Container(
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            controller: searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Search by city name",
                                hintStyle: TextStyle(fontSize: 20.0, color: Colors.white)
                            ),
                          ),

                        )
                      ],
                    ),
                  ),
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      color: Colors.indigo,
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        info['name'],
                                        style: GoogleFonts.lato(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        DateFormat("EEE, d LLL")
                                            .format(DateTime.now()),
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      double latitude = selectedLocation != null
                                          ? selectedLocation.latitude
                                          : 31.5925;
                                      double longitude = selectedLocation != null
                                          ? selectedLocation.longitude
                                          : 74.3095;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SimpleLocationPicker(
                                                    initialLatitude: latitude,
                                                    initialLongitude: longitude,
                                                    appBarTitle: "Select Location",
                                                    zoomLevel: 8,
                                                    appBarColor: Colors.indigo,
                                                    markerColor: Colors.indigo,
                                                  ))).then((value) {
                                        if (value != null) {
                                          setState(() {
                                            selectedLocation = value;
                                            Navigator.pushReplacementNamed(
                                                context, "/loading",
                                                arguments: selectedLocation);
                                          });
                                        }
                                      });
                                    })
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                            child: Column(children: [
                              Transform.scale(
                                  scale: 1.6,
                                  child: SvgPicture.asset(
                                      "assets/svgs/${info['icon']}.svg")),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ((info['temperature']).toString()).substring(0,4),
                                    style: GoogleFonts.lato(
                                      fontSize: 65,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "°C",
                                    style: GoogleFonts.lato(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                info['condition'],
                                style: GoogleFonts.lato(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Feels like ${info['feelsLike']}°C",
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(15),
                      child: Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.indigo,
                              ),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white),
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        FontAwesome5Solid.eye,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text("Visibility",
                                        style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text(
                                      "${info['visibility']} km",
                                      style: GoogleFonts.lato(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.indigo,
                              ),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white),
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Ionicons.ios_water,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text("Humidity",
                                        style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text(
                                      "${info['humidity']}%",
                                      style: GoogleFonts.lato(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.indigo,
                              ),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white),
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        FontAwesome5Solid.wind,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text("Wind Speed",
                                        style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text(
                                      "${info['windSpeed'].floor()} km/hr",
                                      style: GoogleFonts.lato(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),



                  Container(
                      height: 125,
                      child:
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (var i = 0; i < 24; i++)
                            Container(
                              color: Colors.indigo,
                              width: 100,
                              child: Center(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child:Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            weather2.hourly[i][0].toString().substring(10,13),
                                            style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            // "${weather2.hourly[i][2]}",
                                            "${weather2.hourly[i][1].toString()}°C",
                                            style: GoogleFonts.lato(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Transform.scale(
                                            scale: 0.7,
                                            child: SvgPicture.asset(
                                                "assets/svgs/${img[i]}.svg")),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                        ],
                      )
                  ),





                  Column(
                    children: [
                      for (var i = 0; i < 4; i++)
                        Padding(
                          padding: EdgeInsets.only(top: 20.0,right: 50.0,left: 50.0),
                          child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.indigo,
                              ),
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      weather2.future_forecast[i][0],
                                      style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      )
                                  ),
                                  Text(
                                      weather2.future_forecast[i][1],
                                      style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      )
                                  ),
                                  Text(
                                      weather2.future_forecast[i][2],
                                      style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      )
                                  ),
                                  Text(
                                      weather2.future_forecast[i][3],
                                      style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      )
                                  ),
                                ],
                              )
                          ),
                        ),

                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}