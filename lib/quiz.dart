import 'package:flutter/material.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/result_screen.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswer = [];

  Widget? activeScreen;




  @override
  void initState() {
    activeScreen = StartScreen(startQuiz: switchScreen);
    super.initState();
  }

  void restartQuiz(){
    setState(() {
      
      activeScreen = StartScreen(startQuiz: switchScreen);
    });
  }

  void chooseAnswer(String answer){
    selectedAnswer.add(answer);
    if(selectedAnswer.length == questions.length){
      setState(() {

        activeScreen = ResultScreen(chooseAnswer: selectedAnswer, onRestart: restartQuiz, );
      });
    }
  }
  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(onSelectAnwer: chooseAnswer ,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 36, 148, 213),
                Color.fromARGB(255, 17, 116, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
