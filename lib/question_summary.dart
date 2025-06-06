import 'package:flutter/material.dart';

import 'data/questions.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          summaryData.map((data) {
            final questionIndex = data['question_index'] as int;
            return Row(children: [Text((questionIndex + 1).toString())]);
          }).toList(),
    );
  }
}
