import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData _buildTheme() {
  var baseTheme = ThemeData(brightness: Brightness.dark);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.manropeTextTheme(baseTheme.textTheme),
  );
}

final coolDarkTheme = _buildTheme();
