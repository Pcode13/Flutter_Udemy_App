import 'dart:math';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BallPage(),
    );
  }
}

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: const Text('English Words'),
      ),
      body: const RandomEnglish(),
    );
  }
}

class RandomEnglish extends StatefulWidget {
  const RandomEnglish({super.key});

  @override
  State<RandomEnglish> createState() => _RandomEnglishState();
}

class _RandomEnglishState extends State<RandomEnglish> {
  String text = "Hello World";

  void generateRandomWord() {
    setState(() {
      text = WordPair.random().asPascalCase; // Generate a random English word
    });
  }

  void generateLowerCaseWord({bool upperCase=false,bool lowerCase=false}){
    setState(() {
      if(upperCase){
        text = WordPair.random().asUpperCase; // Generate a random English word
      }else if(lowerCase){
        text = WordPair.random().asLowerCase; // Generate a random English word
      }else{
        text = WordPair.random().asPascalCase; // Generate a random English word
      }
    });
  }
  void generateUpperCaseWord(){
    setState(() {
      text = WordPair.random().asUpperCase; // Generate a random English word
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 20.0, color: Colors.teal.shade900),
          ),
          const SizedBox(height: 20), // Added spacing
          _buildButton('Generate Word',generateRandomWord),
          _buildButton('LowerCase',()=>generateLowerCaseWord(lowerCase: true)),
          _buildButton('UpperCase',()=>generateLowerCaseWord(upperCase: true)),


        ],
      ),
    );
  }
}

Widget _buildButton(String text,VoidCallback onPressed){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal.shade900,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      child: Text(text),
    ),

  );

}

