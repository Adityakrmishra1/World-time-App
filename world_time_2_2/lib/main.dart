

import 'package:flutter/material.dart';
import 'package:worldtime22/pages/choose_location.dart';
import 'package:worldtime22/pages/home.dart';
import 'package:worldtime22/pages/loading.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {  //routing
    '/':(context)=>Loading(), //default base routes
    '/home':(context)=>Home(),
    '/location':(context)=>ChooseLocation(),
  },
));

