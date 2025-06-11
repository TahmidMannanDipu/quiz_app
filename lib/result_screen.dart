import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/question_summary.dart';
import 'package:quiz/quiz.dart';

class ResultScreen extends StatefulWidget {
  final List<String> chooseAnswer;
  final VoidCallback onRestart;
  const ResultScreen({super.key, required this.chooseAnswer,required this.onRestart});


  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; widget.chooseAnswer.length > i; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': widget.chooseAnswer[i],
      });
    }
    return summary;
  }


  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswer =
        summaryData.where((data) {
          return data['user_answer'] == data['correct_answer'];
        }).length;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 148, 213),
      body: Container(
        margin: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answeres $numCorrectAnswer out of $numTotalQuestions questions correctly!",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            QuestionSummary(getSummaryData()),
            TextButton.icon(
              icon: Icon(Icons.refresh,color: Colors.white,),
              onPressed: widget.onRestart ,
              label: Text(
                "Restart quiz again",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
