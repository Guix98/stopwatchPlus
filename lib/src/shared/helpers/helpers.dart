import 'package:flutter/material.dart';

TextScaler basicTextScaler(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final isWide = screenWidth < 600.0;
  final scaleFactor = isWide ? 1.0 : screenWidth / 300;
  return TextScaler.linear(scaleFactor);
}

String stopwatchDisplayFormat(Duration duration) {
  return '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}:${(duration.inMilliseconds.remainder(100)).toString().padLeft(2, '0')}';
}
