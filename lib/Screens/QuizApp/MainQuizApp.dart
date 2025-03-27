import 'package:flutter/material.dart';
// import 'Screens/QuizApp/question.dart';
import 'quizBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBank quizBank = QuizBank();
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
  List<Icon> scoreKeeper = [];

  int correctCount = 0;
  int wrongCount = 0;

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBank.getQuestionAnswer();
    setState(() {
      if (quizBank.isFinished() == true) {
        Alert(
          context: context,
          title: 'Quiz Finished!',
          desc: 'Correct: $correctCount\nWrong: $wrongCount',
          buttons: [
            DialogButton(
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  quizBank.reset();
                  scoreKeeper = [];
                  correctCount = 0;
                  wrongCount = 0;
                });
                Navigator.pop(context);
              },
              width: 120,
            ),
          ],
        ).show();
        quizBank.reset();
        scoreKeeper = [];
        correctCount = 0;
        wrongCount = 0;
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
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(children: scoreKeeper),
      ],
    );
  }
}
