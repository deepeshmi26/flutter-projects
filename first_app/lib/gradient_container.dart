import 'package:first_app/styled_text.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({required this.colors, super.key});

  final List<Color> colors;
  void onPressed() {
    // print('Button pressed!');
  }
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/dice-1.png', width: 200, height: 200),
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: StyledText(text: 'Roll Dice'),
            ),
          ],
        ),
      ),
    );
  }
}
