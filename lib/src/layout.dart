import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stopwatches_plus/generated/l10n.dart';
import 'package:stopwatches_plus/src/modules/laps_record/controllers/laps_record_controller.dart';
import 'package:stopwatches_plus/src/modules/laps_record/pages/laps_record_page.dart';
import 'package:stopwatches_plus/src/modules/stopwatch/pages/stopwatch_page.dart';
import 'package:stopwatches_plus/src/shared/widgets/responsive_layout.dart';

class AppLayout extends StatelessWidget {
  AppLayout({super.key});
  final LapsRecordController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return ResponsiveLayout(
      pages: [StopwatchPage(), LapsRecordPage()],
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.timer_outlined), label: locale.stopwatch),
        BottomNavigationBarItem(
            icon: const Icon(Icons.receipt_long), label: locale.lapsRecord),
      ],
      onNavigate: () {
        controller.getRecord();
      },
    );
  }
}
