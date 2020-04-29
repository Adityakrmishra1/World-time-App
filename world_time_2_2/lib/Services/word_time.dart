import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart' ; //for formatting date and time to look better

class WorldTime{
  String location; //location name for UI;
  String time; //time in that location
  String flag;//url of asset flag icon
  String url;//location url for api endpoints
  bool isDaytime; //true or false for either day and night
  WorldTime({         // constructor saving
    this.location,
    this.flag,
    this.url,
});

  Future<void> getTime  ()async
  // future is promises in java script a place holder temporary in front of async
      {
    try {  //error handling using try and catch block.
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body); //json decoder
      // print(data);
      String datetime = data['datetime']; //from json
      String offset = data['utc_offset'].substring(1, 3);
      print(datetime);
      String offset2 = data['utc_offset'].substring(4, 6);//minutes
      print(offset2);
      //print(datetime);
      //print(offset);
      //create a date time object
      DateTime now = DateTime.parse(datetime);
      //print(now);
      now = now.add(Duration(hours: int.parse(offset)));
      now = now.add(Duration(minutes: int.parse(offset2)));
      //print(now);

      //set time property
      isDaytime=(now.hour>6 && now.hour<20)?true:false; //using ternary operator
      print(isDaytime);
      time = DateFormat.jm().format(now); //function from package
    }
    catch (e)
    {
      print('caugth an error :(');
      time='could not get time data :( try again';
    }
  }
}
