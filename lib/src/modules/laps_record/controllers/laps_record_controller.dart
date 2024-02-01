import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stopwatches_plus/src/shared/models/lap_record.dart';

class LapsRecordController extends GetxController {
  final box = GetStorage();
  var record = <LapRecord>[].obs;

  LapsRecordController();

  @override
  void onInit() {
    getRecord();
    super.onInit();
  }

  void getRecord() async {
    final List<dynamic>? recordFromBox = box.read('LapsRecord');
    if (recordFromBox != null) {
      record.value = recordFromBox.map((item) {
        if (item is Map<String, dynamic>) {
          return LapRecord.fromJson(item);
        }
        return item as LapRecord;
      }).toList();
    }
  }
}
