class LapRecord {
  int id;
  List<Duration> laps;

  LapRecord({required this.id, required this.laps});

  factory LapRecord.fromJson(Map<String, dynamic> json) {
    return LapRecord(
      id: json['id'] as int,
      laps: (json['laps'] as List<dynamic>)
          .map((lap) => Duration(milliseconds: lap as int))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'laps': laps.map((lap) => lap.inMilliseconds).toList()};
  }

  String toJsonString() {
    return toJson().toString();
  }
}
