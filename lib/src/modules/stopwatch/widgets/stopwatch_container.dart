import 'package:flutter/material.dart';
import 'package:stopwatches_plus/src/shared/helpers/helpers.dart';
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
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: t.Color.white)),
      padding: isWide
          ? const EdgeInsets.all(t.Spacing.s40)
          : EdgeInsets.all(screenWidth / 10),
      child: Text(
        stopwatchDisplayFormat(_currentTime),
        textAlign: TextAlign.center,
        textScaler: basicTextScaler(context),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
