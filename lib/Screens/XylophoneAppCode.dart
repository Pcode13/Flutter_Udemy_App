import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main()=>runApp(const XylophoneApp());


class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const XylophonePage(),
    );
  }
}

class XylophonePage extends StatelessWidget {
  const XylophonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Xylophone(),
    );
  }
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: () => playSound(soundNumber),
        child: const SizedBox.shrink(), // Empty child to maintain button structure
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: <Widget>[
          buildKey(color: Colors.red, soundNumber: 1),
          buildKey(color: Colors.orange, soundNumber: 2),
          buildKey(color: Colors.yellow, soundNumber: 3),
          buildKey(color: Colors.green, soundNumber: 4),
          buildKey(color: Colors.teal, soundNumber: 5),
          buildKey(color: Colors.blue, soundNumber: 6),
          buildKey(color: Colors.purple, soundNumber: 7),
        ],
      ),
    );
  }
}




