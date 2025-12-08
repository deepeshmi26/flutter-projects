import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final Map<String, Object> summaryData;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(right: 20),
          child: Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: summaryData['correct_answer'] == summaryData['user_answer']
                  ? Colors.amber
                  : Colors.red.shade400,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Text(
              ((summaryData['question_index'] as int) + 1).toString(),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                summaryData['question'].toString(),
                style: TextStyle(color: Colors.white),
              ),
              // SizedBox(height: 5),
              Text(
                summaryData['user_answer'].toString(),
                style: TextStyle(color: Colors.purpleAccent),
              ),
              Text(
                summaryData['correct_answer'].toString(),
                style: TextStyle(
                  color: const Color.fromARGB(255, 54, 216, 244),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
