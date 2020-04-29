import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};

  @override

  Widget build(BuildContext context) {
    //it re runs build
    //to see what we sending from loading screen

   data= data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
   //we don't want to go back to initial data so a ternary operator to check it.
   print(data);
   //set background
   String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
   Color bgcolor =  data['isDaytime'] ? Colors.blue : Colors.indigo[700];

   //we don't have to use set state because we doing it first and then building widget tree
    return Scaffold(
      appBar: AppBar(
        title: Text('World time'),
        centerTitle: true,
        backgroundColor: Colors.purple[800],
      ),

      backgroundColor: bgcolor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,//it will cover whole background image
              )
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
               children: <Widget>[
                 FlatButton.icon(
                     onPressed: () async {
                       //going to select a data list from choose location form pop from update time function
                     dynamic result =await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data={ //data is a map and we are updating it.
                         //updating previous data with this data
                         'time':result['time'],
                         'location':result['location'],
                         'isDaytime':result['isDaytime'],
                         'flag':result['flag'],
                       };
                     });

                     //it will push  a screen above current screen but it exist  inside top screen
                     },
                     icon: Icon(
                         Icons.edit_location,
                     color: Colors.white,
                     size: 29.0,),
                     label: Text('Edit Location',
                     style: TextStyle(
                       color: Colors.white,
                       letterSpacing: 2.0,
                     ),)),
                 SizedBox(height: 20.0,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Text(data['location'],

                       style:TextStyle(
                         fontSize: 20.0,
                         color: Colors.white,
                         letterSpacing: 2.0,
                       ) ,
                     )
                   ],
                 ),
                 SizedBox(height: 20.0,),
                 Text(data['time'],
                 style: TextStyle(
                   color:Colors.white ,
                   fontSize: 66.0,
                 ),)
               ],
              ),
            ),
          )
      ),
    );
  }
}
