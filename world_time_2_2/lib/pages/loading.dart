import 'package:flutter/material.dart';
import 'package:worldtime22/Services/word_time.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';  //spinner

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {
  String  time="Loading";

void setupWorldTime() async {
  WorldTime instance = WorldTime(location: 'Kolkata',flag: 'India.png',url: 'Asia/Kolkata');
  await instance.getTime();
  //from world_time dart .
  // print(instance.time);it print before if don't use await
 /* setState(() {  //it triggers rebuild so ...
    time=instance.time;
  });
  */
  print(instance.isDaytime);
 Navigator.pushReplacementNamed(context, '/home',arguments:{
   //sending key value pair to routes
   //sending location location,flag, and time to home
   'location':instance.location,
   'time':instance.time,
   'flag':instance.flag,
   'isDaytime':instance.isDaytime,
 } );

}
  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.yellowAccent,
      body: Center(

        child:  SpinKitFadingCube(
          color: Colors.indigoAccent[700],
          size: 80.0,
          duration: Duration(milliseconds: 1200),
        ),
      )
    );
  }
}
