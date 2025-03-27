import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'Screens/QuizApp/question.dart';


void main()=>runApp(const QuizzApp());


class QuizzApp extends StatelessWidget {
  const QuizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
        child:Padding(
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
  List<Icon> scoreKeeper=[];
  // List<String> question=[
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // Question q1 =Question(questionText:'You can lead a cow down stairs but not up stairs.',questionAnswer:false);
List<Question> questionList=[
  Question(questionText: 'You can lead a cow down stairs but not up stairs.', questionAnswer: false),
  Question(questionText: 'Approximately one quarter of human bones are in the feet.', questionAnswer: true),
  Question(questionText: 'A slug\'s blood is green.', questionAnswer: true),
];
   int questionNumber=0;
  // List<bool> answers =[false,true,true];

  @override
  void initState() {
    super.initState();
    print(questionList[questionNumber].questionText);
    print(questionList[questionNumber].questionAnswer);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
       Expanded(
         flex:5,
           child:Padding(
             padding:EdgeInsets.all(10.0),
             child: Center(
               child: Text(questionList[questionNumber].questionText,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 25.0,
                   color: Colors.white,
                 ),
               ),
             ),
           )
       ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: TextButton(
              style:ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                bool correctAnswer =questionList[questionNumber].questionAnswer;
                print('questionNumber true: $correctAnswer');
                setState(() {
                  print('questionNumber: $questionNumber');
                  if(correctAnswer==true){
                    print("User got it right");
                    scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
                  }else{
                    print("User got it wrong");
                    scoreKeeper.add(const Icon(Icons.close, color: Colors.green));
                  }
                  questionNumber=questionNumber+1;
                  // scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
                });
              },
              child: Text('True',style: TextStyle(fontSize: 20.0,color: Colors.white),),
            )
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(5.0),
              child: TextButton(
                style:ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {
                  bool correctAnswer =questionList[questionNumber].questionAnswer;
print('questionNumber: $correctAnswer');
                  setState(() {
                    if(correctAnswer==false){
                      print("User got it right");
                      scoreKeeper.add(const Icon(Icons.check, color: Colors.green));

                    }else{
                      print("User got it wrong");
                      scoreKeeper.add(const Icon(Icons.close, color: Colors.green));
                    }
                  });
                },
                child: Text('False',style: TextStyle(fontSize: 20.0,color: Colors.white),),
              )
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}







