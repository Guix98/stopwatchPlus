import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stopwatches_plus/generated/l10n.dart';
import 'package:stopwatches_plus/src/modules/stopwatch/pages/stopwatch_page.dart';
import 'package:stopwatches_plus/themes/cool_dark_theme/cool_dark_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stopwatch+',
      theme: coolDarkTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const StopwatchPage(),
    );
  }
}
