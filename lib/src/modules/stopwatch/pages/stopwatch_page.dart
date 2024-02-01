import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import 'package:stopwatches_plus/generated/l10n.dart';
import 'package:stopwatches_plus/src/modules/stopwatch/controllers/stopwatch_controller.dart';
import 'package:stopwatches_plus/src/modules/stopwatch/widgets/stopwatch_container.dart';
import 'package:stopwatches_plus/src/modules/stopwatch/widgets/stopwatch_controls.dart';
import 'package:stopwatches_plus/src/shared/helpers/helpers.dart';
import 'package:stopwatches_plus/src/shared/widgets/row_or_column.dart';
import 'package:stopwatches_plus/themes/tokens.dart' as t;

class StopwatchPage extends StatelessWidget {
  final StopwatchController controller = Get.find();

  StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return Obx(
      () => RowOrColumn(
        children: <Widget>[
          Column(
            children: [
              StopwatchContainer(currentTime: controller.currentTime.value),
              const SizedBox(
                height: 20,
              ),
              StopwatchControls(
                onPlayButton: () {
                  if (controller.isRunning.value) {
                    controller.stopTimer();
                  } else {
                    controller.startTimer();
                  }
                },
                onResetButton: () {
                  controller.resetTimer();
                  showTextSnackbar(context, locale.dataStorageNotice);
                },
                isRunning: controller.isRunning.value,
              ),
            ],
          ),
          const SizedBox(
            width: t.Spacing.s16,
            height: t.Spacing.s16,
          ),
          Expanded(
            child: Container(
              color: t.Color.black3,
              padding: const EdgeInsets.symmetric(horizontal: t.Spacing.s16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: t.Spacing.s12),
                  Text(
                    locale.laps,
                    textScaler: controller.isRunning.value
                        ? MediaQuery.textScalerOf(context)
                        : null,
                  ),
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        itemCount: controller.pauseTimes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                '${index + 1}: ${stopwatchDisplayFormat(controller.pauseTimes[index])}',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
