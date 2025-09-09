import 'package:flutter/material.dart';

class TimerDisplay extends StatelessWidget {
  final int seconds;

  const TimerDisplay({super.key, required this.seconds});

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatTime(seconds),
      style: TextStyle(
        fontSize: 80,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
