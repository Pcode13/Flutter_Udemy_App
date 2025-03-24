import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.teal,
            body:SafeArea(
                child:
             Column(
               // mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 CircleAvatar(
                   radius: 50.0,
                   backgroundImage: AssetImage('images/d1.jpg'),

                 ),
                 Text('Pragati Veer',
                 style: TextStyle(
                     fontSize: 40.0,
                 color: Colors.white70,
                 fontWeight:FontWeight.bold,
                   fontFamily: 'Pacifico'
                 ),),
                 Text('Clover Infotech',
                 style: TextStyle(
                     fontSize: 20.0,
                     color: Colors.teal.shade100,
                     fontWeight:FontWeight.bold,
                     fontFamily: 'SourceSansPro',
                   letterSpacing: 2.5
                 ),)
               ],
             )
            )


        )
    );
  }
}
