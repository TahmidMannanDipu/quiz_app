import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/widgets/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnwer});

  final void Function(String answer) onSelectAnwer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnwer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 148, 213),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              ...currentQuestion.getShuffeledAnswer().map((answer) {
                return AnswerButton(
                  onPressed: () {
                    answerQuestion(answer);
                  },
                  answerText: answer,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
