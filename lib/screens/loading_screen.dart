

import 'package:flutter/material.dart';
import 'package:weatherapp/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apikey = '3ad533bec3b2c30648a675048cefecee';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
    double? latitude;
    double? longitude;

  @override
  void initState(){
    super.initState();
    getLocation();
    print('this line of code is triggered');
  }
  void getLocation() async{
    Location location = Location();
    await location.getCurrentLocation();

     latitude = location.latitude; //44.34
     longitude = location.longitude;//10.99
    getData();// for using this function inthe class we have to make the function await
  }

  void getData()async{
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey'));
    // print(response.statusCode);

    if(response.statusCode ==200) {
      String data = response.body;

      var temp = jsonDecode(data)['main']['temp'];
      print(temp);
      var id = jsonDecode(data)['weather'][0]['id'];
      print(id);
      var city = jsonDecode(data)['name'];
      print(city);


    }else{
      print(response.statusCode);
      
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       getLocation();
      //       //Get the current location
      //     },
      //     child: Text('Get Location'),
      //   ),
      // ),
    );
  }
}