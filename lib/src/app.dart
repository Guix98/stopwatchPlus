import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';

import 'package:stopwatches_plus/generated/l10n.dart';
import 'package:stopwatches_plus/src/layout.dart';
import 'package:stopwatches_plus/src/modules/laps_record/controllers/laps_record_controller.dart';
import 'package:stopwatches_plus/src/modules/stopwatch/controllers/stopwatch_controller.dart';
import 'package:stopwatches_plus/themes/cool_dark_theme/cool_dark_theme.dart';

class App extends StatelessWidget {
  final StopwatchController stopwatchController =
      Get.put(StopwatchController());
  final LapsRecordController lapsRecordController =
      Get.put(LapsRecordController());
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stopwatch+',
      theme: coolDarkTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: AppLayout(),
    );
  }
}
