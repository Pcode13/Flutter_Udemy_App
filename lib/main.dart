import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.teal.shade900,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int leftDiceNumbers=5;
  int rightDiceNumbers=2;
  int middleDiceNumbers=3;

  late String resultText;

  void diceChangeNumbers(){
    setState(() {
      leftDiceNumbers=Random().nextInt(6)+1;
      rightDiceNumbers=Random().nextInt(6)+1;
      middleDiceNumbers=Random().nextInt(6)+1;

      if (leftDiceNumbers == middleDiceNumbers && middleDiceNumbers == rightDiceNumbers) {
        resultText = "You are lucky, Win the Game! 🎉";
      } else {
        resultText = "You are unlucky, Lose the Game! 😢";
      }
    });

print("resultText $resultText");
  }



  @override
  Widget build(BuildContext context) {
    return
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Text("Roll and Win",style: TextStyle(fontSize: 50.0,fontFamily: 'Pacifico',color: Colors.white,fontWeight: FontWeight.bold)),
            SizedBox(height: 50.0),
            Row(
              children: <Widget>[
                Expanded(
                  child:
                  IconButton(
                    onPressed: () {
                      diceChangeNumbers();
                    },
                    icon: Image.asset('images/dice$leftDiceNumbers.png'),
                    iconSize: 30,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Image.asset('images/dice$middleDiceNumbers.png'),
                    iconSize: 30,
                    onPressed: () {
                      diceChangeNumbers();
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Image.asset('images/dice$rightDiceNumbers.png'),
                    iconSize: 30,
                    onPressed: () {
                      diceChangeNumbers();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                print('Styled Button Clicked');
                diceChangeNumbers();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade900,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: Text('Roll'),
            ),
            SizedBox(height: 50.0),

            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3), // Semi-transparent background
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                resultText,
                style: TextStyle(
                  fontSize: 22.0,
                  color: (leftDiceNumbers == middleDiceNumbers && middleDiceNumbers == rightDiceNumbers)
                      ? Colors.white
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ]
      );

  }
}


