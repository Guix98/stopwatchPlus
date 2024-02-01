import 'dart:async';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stopwatches_plus/src/shared/models/lap_record.dart';

class StopwatchController extends GetxController {
  final box = GetStorage();
  var currentTime = const Duration().obs;
  var pauseTimes = <Duration>[].obs;
  var isRunning = false.obs;
  late Timer timer;

  void startTimer() {
    isRunning(true);
    timer = Timer.periodic(const Duration(milliseconds: 10), (Timer timer) {
      currentTime.value = currentTime.value + const Duration(milliseconds: 10);
    });
  }

  void stopTimer() {
    isRunning(false);
    timer.cancel();
    pauseTimes.add(currentTime.value);
  }

  void resetTimer() async {
    await saveTime();
    isRunning(false);
    currentTime.value = Duration.zero;
    pauseTimes.clear();
    timer.cancel();
  }

  Future<void> saveTime() async {
    List<LapRecord> records = [];
    if (await box.read('LapsRecord') == null) {
      box.write('LapsRecord', records);
    }
    final List<dynamic> recordFromBox = box.read('LapsRecord');
    records = recordFromBox.map((item) {
      if (item is Map<String, dynamic>) {
        return LapRecord.fromJson(item);
      }
      return item as LapRecord;
    }).toList();

    records.add(
        LapRecord(id: DateTime.now().millisecondsSinceEpoch, laps: pauseTimes));
    await box.write('LapsRecord', records);
    // print(LapRecord.fromJson(jsonDecode(box.read('timeA'))).laps.toString());
  }
}
