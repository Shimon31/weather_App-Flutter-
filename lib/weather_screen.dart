import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather App")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Enter City Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Get Weather")),
            SizedBox(height: 10),
            Image.network(
              "https://npr.brightspotcdn.com/dims3/default/strip/false/crop/2000x1304+0+0/resize/1100/quality/50/format/jpeg/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2Fd1%2F41%2F90fa03af4636a1f5bc89474d4c2a%2Fap24324862737556.jpg",
            ),

          ],
        ),
      ),
    );
  }
}
