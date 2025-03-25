import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.red,
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
  @override
  int leftDiceNumbers=5;
  int rightDiceNumbers=2;
  Widget build(BuildContext context) {

    return  Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child:
              IconButton(
                onPressed: () {
                  setState(() {
                    leftDiceNumbers=Random().nextInt(6)+1;
                    print('First Button Pressed: $leftDiceNumbers');
                  });

                },
                icon: Image.asset('images/dice$leftDiceNumbers.png'),
                iconSize: 50,

              ),

            ),
            Expanded(
              child: IconButton(
                icon: Image.asset('images/dice$rightDiceNumbers.png'),
                iconSize: 50,
                onPressed: () {
                  setState(() {
                    rightDiceNumbers=Random().nextInt(6)+1;
                    print('Second Button Pressed: $rightDiceNumbers');
                  });
                },
              ),
            ),
          ],
        )
    );
  }
}


