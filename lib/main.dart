import 'package:flutter/material.dart';

void main(){
  runApp(
MaterialApp(
home: Scaffold(
  backgroundColor: Colors.red.shade300,
  appBar: AppBar(
    title: Text("Flutter App "),
    backgroundColor: Colors.pinkAccent,
  ),
  body:Center(

      child: Image(image:AssetImage("images/dimond.png"))
  )


)
)
);
}
