import 'package:flutter/material.dart';
import 'Screens/QuizApp/question.dart';

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

  List<Question> questionList = [
    Question(
      questionText: 'You can lead a cow down stairs but not up stairs.',
      questionAnswer: false,
    ),
    Question(
      questionText: 'Approximately one quarter of human bones are in the feet.',
      questionAnswer: true,
    ),
    Question(questionText: 'A slug\'s blood is green.', questionAnswer: true),
  ];
  int questionNumber = 0;

  @override
  void initState() {
    super.initState();
    print(questionList[questionNumber].questionText);
    print(questionList[questionNumber].questionAnswer);
  }

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = questionList[questionNumber].questionAnswer;

    setState(() {
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
      }
      if (questionNumber < questionList.length - 1) {
        questionNumber++;
      } else {
        questionNumber = 0;
        scoreKeeper = [];
      }
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
                questionList[questionNumber].questionText,
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
