import "package:flutter/material.dart";

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset("assets/images/quiz-logo.png", height: 200),
          ),
          const SizedBox(height: 20),
          Text(
            "Let learn flutter the fun way",
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          const SizedBox(height: 20),

          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.arrow_right_alt),
            label: Text("Start quiz"),
          ),
        ],
      ),
    );
  }
}
