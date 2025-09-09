import 'package:flutter/material.dart';

class ControlButtons extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onStart;
  final VoidCallback onPause;
  final VoidCallback onReset;

  const ControlButtons({
    super.key,
    required this.isRunning,
    required this.onStart,
    required this.onPause,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isRunning
            ? ElevatedButton.icon(
                onPressed: onPause,
                label: const Text("Pause"),
                icon: const Icon(Icons.pause),
              )
            : ElevatedButton.icon(
                onPressed: onStart,
                label: const Text("Start"),
                icon: const Icon(Icons.play_arrow),
              ),
        const SizedBox(width: 20),
        ElevatedButton.icon(
          onPressed: onReset,
          label: Text("Reset"),
          icon: Icon(Icons.restore),
        ),
      ],
    );
  }
}
