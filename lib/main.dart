import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:locate/network.dart';
import 'loading.dart';
import 'locate.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'network.dart';
import 'weather.dart';
const api="98c0d123fa895ee2421f6be704e913f5";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    // TODO: implement initState
    super.initState();
    print("locationwidget clicked");
  }
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("ended");
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(title: Text("FETCHED DATA",style: TextStyle(),textAlign: TextAlign.center,),),
        body: z(),
      ),
    );
  }
}

class z extends StatefulWidget {
  @override
  _zState createState() => _zState();
}

class _zState extends State<z> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print("locationwidget clicked");
  // }
  double la;
  double long;
  @override
  // void deactivate() {
  //   // TODO: implement deactivate
  //   super.deactivate();
  //   print("ended");
  // }
  void locate()async{
    WeatherModel get=WeatherModel();
    var w1=await get.getLocationWeather();
    // print(wea["main"]);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(w1)));
  }

  @override

  Widget build(BuildContext context) {
    // String s1='21';
    // double d;
    // try{
    //   d=double.parse(s1);
    //   print(d);
    // }
    // catch(e){
    //   print(e);
    //
    // }
    locate();
    return Center(
      child:  SpinKitCubeGrid(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}

