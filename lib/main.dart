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
               mainAxisAlignment: MainAxisAlignment.center,
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
                 ),),
                 SizedBox(height: 20.0,
                 width: 150.0,
                 child: Divider(
                   color: Colors.teal.shade100,
                 ),
                 ),
                 Card(

                   margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                   child: ListTile(
                     leading: Icon(Icons.phone,color: Colors.teal,),
                     title:
                  Text('+91 9999999999',
                  style:
                TextStyle(fontSize: 20.0,color: Colors.teal.shade900,
                   ),
                     ),

                   )
                 ),
                 Card(
                   margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                   child:
                   ListTile(
                     leading: Icon(Icons.email,color: Colors.teal,),
                     title:
                     Text('veer99@gmail.com',
                       style:
                       TextStyle(fontSize: 20.0,color: Colors.teal.shade900,
                       ),
                     ),

                   )

                 )
               ],
             )
            )


        )
    );
  }
}


// Row(
// children: <Widget>[
// Icon(Icons.email,color: Colors.teal,),
// SizedBox(width: 10.0,),
// Text('veer99@gmail.com',style: TextStyle(fontSize: 20.0,color: Colors.teal.shade900,
// fontFamily: 'SourceSansPro'),
// )
// ],
// )