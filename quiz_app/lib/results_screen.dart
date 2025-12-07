import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var totalQuestions = questions.length;
    var summaryData = getSummaryData();
    var correctQuestions = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "You correctly answered $correctQuestions out of $totalQuestions.",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
              SizedBox(
                height: 300,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...summaryData.map((summaryData) {
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
                                  color:
                                      summaryData['correct_answer'] ==
                                          summaryData['user_answer']
                                      ? Colors.amber
                                      : Colors.red.shade400,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                                child: Text(
                                  ((summaryData['question_index'] as int) + 1)
                                      .toString(),
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
                                    style: TextStyle(
                                      color: Colors.purpleAccent,
                                    ),
                                  ),
                                  Text(
                                    summaryData['correct_answer'].toString(),
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        54,
                                        216,
                                        244,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),

              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.replay_outlined, color: Colors.white),
                label: Text(
                  "Restart quiz",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
