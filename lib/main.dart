import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stopwatches_plus/modules/stopwatch/pages/stopwatch_page.dart';
import 'package:stopwatches_plus/themes/cool_dark_theme/cool_dark_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stopwatch+',
      theme: coolDarkTheme,
      home: const StopwatchPage(),
    );
  }
}
