import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:intl/intl.dart';

TextScaler basicTextScaler(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final isWide = screenWidth < 600.0;
  final scaleFactor = isWide ? 1.0 : screenWidth / 300;
  return TextScaler.linear(scaleFactor);
}

String stopwatchDisplayFormat(Duration duration) {
  return '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}:${(duration.inMilliseconds.remainder(100)).toString().padLeft(2, '0')}';
}

String formattedDateFromMilliseconds(int milliseconds) {
  final formatter = DateFormat('EEE, M/d/y - HH:mm');
  final date = DateTime.fromMillisecondsSinceEpoch(milliseconds);
  return formatter.format(date);
}

void showTextSnackbar(
  BuildContext context,
  String text, {
  Duration? duration = const Duration(milliseconds: 2000),
}) {
  Flushbar(
    message: text,
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
    borderRadius: BorderRadius.circular(8),
    duration: duration,
  ).show(context);
}

void showModal(BuildContext context,
    {required String title, required Widget content}) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: content,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      );
    },
  );
}
