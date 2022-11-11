class WeatherData {
  String condition;
  num temperature;
  num feelsLike;
  num pressure;
  num visibility;
  String humidity;
  num windSpeed;
  String country;
  String name;
  String icon;
  var hourly=new List(24);

  WeatherData(
      {this.condition,
        this.temperature,
        this.feelsLike,
        this.visibility,
        this.pressure,
        this.humidity,
        this.windSpeed,
        this.country,
        this.name,
        this.icon,
        this.hourly,});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(

      condition: json['current']['weather'][0]['main'],
      temperature: (json['current']['temp']*0.1).round(),
      feelsLike: (json['current']['feels_like']*0.1).round(),
      visibility: (json['current']['visibility'] / 1000).round(),
      pressure: (json['current']['pressure']),
      humidity: json['current']['humidity'].toString(),
      windSpeed: (json['current']['wind_speed'] * 3.6),
      // country: json['sys']['country'],
      name: json['timezone'],
      icon: json['current']['weather'][0]['icon'],
      hourly: [
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][0]['dt'] * 1000).hour,(json['hourly'][0]['temp']* 0.1).round(),json['hourly'][0]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][1]['dt'] * 1000).hour,(json['hourly'][1]['temp']* 0.1).round(),json['hourly'][1]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][2]['dt'] * 1000).hour,(json['hourly'][2]['temp']* 0.1).round(),json['hourly'][2]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][3]['dt'] * 1000).hour,(json['hourly'][3]['temp']* 0.1).round(),json['hourly'][3]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][4]['dt'] * 1000).hour,(json['hourly'][4]['temp']* 0.1).round(),json['hourly'][4]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][5]['dt'] * 1000).hour,(json['hourly'][5]['temp']* 0.1).round(),json['hourly'][5]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][6]['dt'] * 1000).hour,(json['hourly'][6]['temp']* 0.1).round(),json['hourly'][6]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][7]['dt'] * 1000).hour,(json['hourly'][7]['temp']* 0.1).round(),json['hourly'][7]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][8]['dt'] * 1000).hour,(json['hourly'][8]['temp']* 0.1).round(),json['hourly'][8]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][9]['dt'] * 1000).hour,(json['hourly'][9]['temp']* 0.1).round(),json['hourly'][9]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][10]['dt'] * 1000).hour,(json['hourly'][10]['temp']* 0.1).round(),json['hourly'][10]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][11]['dt'] * 1000).hour,(json['hourly'][11]['temp']* 0.1).round(),json['hourly'][11]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][12]['dt'] * 1000).hour,(json['hourly'][12]['temp']* 0.1).round(),json['hourly'][12]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][13]['dt'] * 1000).hour,(json['hourly'][13]['temp']* 0.1).round(),json['hourly'][13]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][14]['dt'] * 1000).hour,(json['hourly'][14]['temp']* 0.1).round(),json['hourly'][14]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][15]['dt'] * 1000).hour,(json['hourly'][15]['temp']* 0.1).round(),json['hourly'][15]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][16]['dt'] * 1000).hour,(json['hourly'][16]['temp']* 0.1).round(),json['hourly'][16]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][17]['dt'] * 1000).hour,(json['hourly'][17]['temp']* 0.1).round(),json['hourly'][17]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][18]['dt'] * 1000).hour,(json['hourly'][18]['temp']* 0.1).round(),json['hourly'][18]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][19]['dt'] * 1000).hour,(json['hourly'][19]['temp']* 0.1).round(),json['hourly'][19]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][20]['dt'] * 1000).hour,(json['hourly'][20]['temp']* 0.1).round(),json['hourly'][20]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][21]['dt'] * 1000).hour,(json['hourly'][21]['temp']* 0.1).round(),json['hourly'][21]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][22]['dt'] * 1000).hour,(json['hourly'][22]['temp']* 0.1).round(),json['hourly'][22]['weather'][0]['icon']],
        [DateTime.fromMillisecondsSinceEpoch(json['hourly'][23]['dt'] * 1000).hour,(json['hourly'][23]['temp']* 0.1).round(),json['hourly'][23]['weather'][0]['icon']],
      ],
    );
  }
}

class WeatherData2{
  var future_forecast=new List(5);
  var hourly=new List(24);

  WeatherData2(
      {this.future_forecast,
        this.hourly,}
      );
  factory WeatherData2.fromJson(Map<String, dynamic> json) {
    return WeatherData2(
        future_forecast: [
          [json['forecast']['forecastday'][1]['date'].toString(),json['forecast']['forecastday'][1]['day']['condition']['text'].toString(),json['forecast']['forecastday'][1]['day']['maxtemp_c'].toString(),json['forecast']['forecastday'][1]['day']['mintemp_c'].toString()],
          [json['forecast']['forecastday'][2]['date'].toString(),json['forecast']['forecastday'][2]['day']['condition']['text'].toString(),json['forecast']['forecastday'][2]['day']['maxtemp_c'].toString(),json['forecast']['forecastday'][2]['day']['mintemp_c'].toString()],
          [json['forecast']['forecastday'][3]['date'].toString(),json['forecast']['forecastday'][3]['day']['condition']['text'].toString(),json['forecast']['forecastday'][3]['day']['maxtemp_c'].toString(),json['forecast']['forecastday'][3]['day']['mintemp_c'].toString()],
          [json['forecast']['forecastday'][4]['date'].toString(),json['forecast']['forecastday'][4]['day']['condition']['text'].toString(),json['forecast']['forecastday'][4]['day']['maxtemp_c'].toString(),json['forecast']['forecastday'][4]['day']['mintemp_c'].toString()],
        ],


        hourly: [
          [json['forecast']['forecastday'][0]['hour'][0]['time'],json['forecast']['forecastday'][0]['hour'][0]['temp_c'],json['forecast']['forecastday'][0]['hour'][0]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][1]['time'],json['forecast']['forecastday'][0]['hour'][1]['temp_c'],json['forecast']['forecastday'][0]['hour'][1]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][2]['time'],json['forecast']['forecastday'][0]['hour'][2]['temp_c'],json['forecast']['forecastday'][0]['hour'][2]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][3]['time'],json['forecast']['forecastday'][0]['hour'][3]['temp_c'],json['forecast']['forecastday'][0]['hour'][3]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][4]['time'],json['forecast']['forecastday'][0]['hour'][4]['temp_c'],json['forecast']['forecastday'][0]['hour'][4]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][5]['time'],json['forecast']['forecastday'][0]['hour'][5]['temp_c'],json['forecast']['forecastday'][0]['hour'][5]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][6]['time'],json['forecast']['forecastday'][0]['hour'][6]['temp_c'],json['forecast']['forecastday'][0]['hour'][6]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][7]['time'],json['forecast']['forecastday'][0]['hour'][7]['temp_c'],json['forecast']['forecastday'][0]['hour'][7]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][8]['time'],json['forecast']['forecastday'][0]['hour'][8]['temp_c'],json['forecast']['forecastday'][0]['hour'][8]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][9]['time'],json['forecast']['forecastday'][0]['hour'][9]['temp_c'],json['forecast']['forecastday'][0]['hour'][9]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][10]['time'],json['forecast']['forecastday'][0]['hour'][10]['temp_c'],json['forecast']['forecastday'][0]['hour'][10]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][11]['time'],json['forecast']['forecastday'][0]['hour'][11]['temp_c'],json['forecast']['forecastday'][0]['hour'][11]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][12]['time'],json['forecast']['forecastday'][0]['hour'][12]['temp_c'],json['forecast']['forecastday'][0]['hour'][12]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][13]['time'],json['forecast']['forecastday'][0]['hour'][13]['temp_c'],json['forecast']['forecastday'][0]['hour'][13]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][14]['time'],json['forecast']['forecastday'][0]['hour'][14]['temp_c'],json['forecast']['forecastday'][0]['hour'][14]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][15]['time'],json['forecast']['forecastday'][0]['hour'][15]['temp_c'],json['forecast']['forecastday'][0]['hour'][15]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][16]['time'],json['forecast']['forecastday'][0]['hour'][16]['temp_c'],json['forecast']['forecastday'][0]['hour'][16]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][17]['time'],json['forecast']['forecastday'][0]['hour'][17]['temp_c'],json['forecast']['forecastday'][0]['hour'][17]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][18]['time'],json['forecast']['forecastday'][0]['hour'][18]['temp_c'],json['forecast']['forecastday'][0]['hour'][18]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][19]['time'],json['forecast']['forecastday'][0]['hour'][19]['temp_c'],json['forecast']['forecastday'][0]['hour'][19]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][20]['time'],json['forecast']['forecastday'][0]['hour'][20]['temp_c'],json['forecast']['forecastday'][0]['hour'][20]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][21]['time'],json['forecast']['forecastday'][0]['hour'][21]['temp_c'],json['forecast']['forecastday'][0]['hour'][21]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][22]['time'],json['forecast']['forecastday'][0]['hour'][22]['temp_c'],json['forecast']['forecastday'][0]['hour'][22]['condition']['icon']],
          [json['forecast']['forecastday'][0]['hour'][23]['time'],json['forecast']['forecastday'][0]['hour'][23]['temp_c'],json['forecast']['forecastday'][0]['hour'][23]['condition']['icon']],

        ]
    );
  }
}
