import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:stopwatches_plus/generated/l10n.dart';
import 'package:stopwatches_plus/src/modules/laps_record/controllers/laps_record_controller.dart';
import 'package:stopwatches_plus/src/shared/helpers/helpers.dart';
import 'package:stopwatches_plus/themes/tokens.dart' as t;

class LapsRecordPage extends StatelessWidget {
  LapsRecordPage({super.key});
  final LapsRecordController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: t.Spacing.s16),
          child: ListView.builder(
              itemCount: controller.record.length,
              itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text(
                          '${index + 1}: ${formattedDateFromMilliseconds(controller.record[index].id)}'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () => showModal(
                        context,
                        title:
                            "${locale.lapsRecord}: ${formattedDateFromMilliseconds(controller.record[index].id)}",
                        content: Padding(
                          padding: EdgeInsets.all(t.Spacing.s12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.record[index].laps
                                .map((lap) => Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: t.FontSize.sm,
                                        ),
                                        const SizedBox(
                                          width: t.Spacing.s4,
                                          height: t.Spacing.s24,
                                        ),
                                        Text(
                                          '$lap',
                                          style: TextStyle(
                                              fontSize: t.FontSize.lg),
                                        )
                                      ],
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  )),
        ));
  }
}
