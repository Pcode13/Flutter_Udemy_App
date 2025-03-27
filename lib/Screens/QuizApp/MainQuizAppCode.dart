import 'package:flutter/material.dart';
import 'quizBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(const QuizzApp());

class QuizzApp extends StatelessWidget {
  const QuizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Quiz(),
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final QuizBank quizBank = QuizBank();
  List<Icon> scoreKeeper = [];

  int correctCount = 0;
  int wrongCount = 0;

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBank.getQuestionAnswer();
    setState(() {
      if (quizBank.isFinished() == true) {
        _showCompletionAlert();
      } else if (userAnswer == correctAnswer) {
        correctCount++;
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
      } else {
        wrongCount++;
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
      }
      quizBank.nextQuestion();
    });
  }

  void _showCompletionAlert() {
    Alert(
      context: context,
      title: 'Quiz Completed!',
      desc: 'Correct: $correctCount\nWrong: $wrongCount',
      buttons: [
        DialogButton(
          child: const Text(
            "Restart",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              quizBank.reset();
              scoreKeeper.clear();
              correctCount = 0;
              wrongCount = 0;
            });
            Navigator.pop(context);
          },
          width: 120,
        ),
      ],
    ).show();
  }

  Widget _buildAnswerButton(String text, Color color, bool answer) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => checkAnswer(answer),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBank.getQuestionBank(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        _buildAnswerButton('True', Colors.green, true),
        _buildAnswerButton('False', Colors.red, false),
        Row(children: scoreKeeper),
      ],
    );
  }
}
