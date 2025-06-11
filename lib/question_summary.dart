import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children:
              summaryData.map((data) {
                final questionIndex = data['question_index'] as int;
                return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [CircleAvatar(
                  backgroundColor: data['user_answer'] == data['correct_answer']? Colors.green: Colors.red,
                    child: Text((questionIndex + 1).toString(),style: TextStyle(
                      color: Colors.white,
                    ),)),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'] as String,style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                      const SizedBox(
                        height: 8,
                      ),
                      Text("Your answer: ${data['user_answer'] as String}",style: GoogleFonts.roboto(
                        color: Colors.deepPurpleAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text("Correct answer:${data['correct_answer'] as String}", style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),),


                    ],
                  ),
                )
                ]);
              }).toList(),
        ),
      ),
    );
  }
}
