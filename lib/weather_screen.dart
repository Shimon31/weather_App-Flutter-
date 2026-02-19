import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController cityController = TextEditingController();

  String city = "";
  String temperature = "";
  String feelsLike = "";
  String windSpeed = "";
  String humidity = "";
  String visibility = "";
  String pressure = "";
  String uvIndex = "";
  String description = "";
  String icon = "";
  String localTime = "";
  bool isLoading = false;

  final String apiKey = "291e2d051e624ed488974910240410";
  final String baseUrl = "http://api.weatherapi.com/v1/current.json";

  Future fetchWeather() async {
    setState(() {
      isLoading=true;
    });
    final url = "$baseUrl?key=$apiKey&q=$city";
    final response = await http.get(Uri.parse(url), headers: {'accept': "application/json"});
    final data = json.decode(response.body);
    setState(() {
      isLoading=false;
    });
    setState(() {
      temperature = "Temperature : ${data['current']['temp_c']} C";
      feelsLike = "Feels Like : ${data['current']['feelslike_c']} C";
      windSpeed = "Wind Speed : ${data['current']['wind_kph']} KPH";
      humidity = "Hmidity : ${data['current']['humidity']} ";
      visibility = "Visibility : ${data['current']['vis_km']} KPH";
      pressure = "Pressure : ${data['current']['pressure_in']} ";
      uvIndex = "UV : ${data['current']['uv']} ";
      description = "Description : ${data['current']['condition']['text']} ";
      icon = "Icon : ${data['current']['condition']['icon']} ";
      localTime = "LocalTime : ${data['location']['localtime']} ";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather App")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                hintText: "Enter City Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  city = cityController.text;
                });
                fetchWeather();
              },
              child: isLoading?SizedBox(height: 10,width: 10,
              child: CircularProgressIndicator(strokeWidth: 2,color: Colors.green,),
              ):Text("Get Weather"),
            ),
            SizedBox(height: 10),
            Text(
              temperature,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              feelsLike,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 11),
            Text(
              windSpeed,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              humidity,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Text(
              visibility,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              pressure,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              uvIndex,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              localTime,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.network(
              "https://npr.brightspotcdn.com/dims3/default/strip/false/crop/2000x1304+0+0/resize/1100/quality/50/format/jpeg/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2Fd1%2F41%2F90fa03af4636a1f5bc89474d4c2a%2Fap24324862737556.jpg",
            height: 200,
            width: 400,),
          ],
        ),
      ),
    );
  }
}
