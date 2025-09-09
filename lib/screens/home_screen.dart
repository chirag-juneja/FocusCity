import 'dart:async';

import 'package:flutter/material.dart';

import 'package:focuscity/widgets/timer_display.dart';
import 'package:focuscity/widgets/control_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int duration = 25 * 60;
  int seconds = duration;
  bool isRunning = false;
  Timer? timer;

  void _start() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        t.cancel();
        setState(() {
          isRunning = false;
        });
      }
    });
    setState(() {
      isRunning = true;
    });
  }

  void _pause() {
    timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void _reset() {
    timer?.cancel();
    setState(() {
      isRunning = false;
      seconds = duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Focus City",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TimerDisplay(seconds: seconds),
            ControlButtons(
              isRunning: isRunning,
              onStart: _start,
              onPause: _pause,
              onReset: _reset,
            ),
          ],
        ),
      ),
    );
  }
}
