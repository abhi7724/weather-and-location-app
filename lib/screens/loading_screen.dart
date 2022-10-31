

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/screens/location_screen.dart';
import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';
import 'location_screen.dart';


const apikey = '3ad533bec3b2c30648a675048cefecee';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

  class _LoadingScreenState extends State<LoadingScreen> {
    double? latitude;
    double? longitude;

    @override
    void initState() {
      super.initState();
      getLocationData();
      print('this line of code is triggered');
    }

    void getLocationData() async {
      Location location = Location();
      await location.getCurrentLocation();

      latitude = location.latitude; //44.34
      longitude = location.longitude; //10.99
      NetworkHelper networkHelper = NetworkHelper(
          'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

      var weatherData = await networkHelper.getData();
      // for using this function inthe class we have to make the function await

      // after context the machine itself demands a callback
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData,);
      }));
    }


      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: SpinKitDoubleBounce(
              color: Colors.white,
              size: 100,
            ),
          ),
        );
      }
    }

