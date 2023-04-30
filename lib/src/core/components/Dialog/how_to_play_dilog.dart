import 'package:flutter/material.dart';

class HowToPlayDialog extends StatelessWidget {
  const HowToPlayDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          _textLine('Start the game and start solving the questions'),
          _textLine('No time limit for questions'),
          _textLine('10 questions each round.'),
        ],
      ),
      actions: <Widget>[
        Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('OKAY'),
          ),
        ),
      ],
    );
  }

  Widget _textLine(String content) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        content,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
