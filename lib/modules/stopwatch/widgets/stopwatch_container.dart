import 'package:flutter/material.dart';
import 'package:stopwatches_plus/themes/tokens.dart' as t;

class StopwatchContainer extends StatelessWidget {
  const StopwatchContainer({
    super.key,
    required Duration currentTime,
  }) : _currentTime = currentTime;

  final Duration _currentTime;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth < 600.0;
    final scaleFactor = isWide ? 1.0 : screenWidth / 300;
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: t.Color.white)),
      padding: isWide
          ? const EdgeInsets.all(t.Spacing.s40)
          : EdgeInsets.all(screenWidth / 10),
      child: Text(
        'Tiempo: \n${(_currentTime.inMinutes.remainder(60)).toString().padLeft(2, '0')}:${(_currentTime.inSeconds.remainder(60)).toString().padLeft(2, '0')}:${(_currentTime.inMilliseconds.remainder(100)).toString().padLeft(2, '0')}',
        textAlign: TextAlign.center,
        textScaler: TextScaler.linear(scaleFactor),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
