class MapRotation {
  Current? current;
  Next? next;

  MapRotation({this.current, this.next});

  MapRotation.fromJson(Map<String, dynamic> json) {
    current = json['current'] != null ? Current.fromJson(json['current']) : null;
    next = json['next'] != null ? Next.fromJson(json['next']) : null;
  }
}

class Current {
  int? start;
  int? end;
  String? readableDateStart;
  String? readableDateEnd;
  String? map;
  String? code;
  int? durationInSecs;
  int? durationInMinutes;
  String? asset;
  int? remainingSecs;
  int? remainingMins;
  String? remainingTimer;

  Current(
      {this.start,
      this.end,
      this.readableDateStart,
      this.readableDateEnd,
      this.map,
      this.code,
      this.durationInSecs,
      this.durationInMinutes,
      this.asset,
      this.remainingSecs,
      this.remainingMins,
      this.remainingTimer});

  Current.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
    readableDateStart = json['readableDate_start'];
    readableDateEnd = json['readableDate_end'];
    map = json['map'];
    code = json['code'];
    durationInSecs = json['DurationInSecs'];
    durationInMinutes = json['DurationInMinutes'];
    asset = json['asset'];
    remainingSecs = json['remainingSecs'];
    remainingMins = json['remainingMins'];
    remainingTimer = json['remainingTimer'];
  }
}

class Next {
  int? start;
  int? end;
  String? readableDateStart;
  String? readableDateEnd;
  String? map;
  String? code;
  int? durationInSecs;
  int? durationInMinutes;

  Next(
      {this.start,
      this.end,
      this.readableDateStart,
      this.readableDateEnd,
      this.map,
      this.code,
      this.durationInSecs,
      this.durationInMinutes});

  Next.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
    readableDateStart = json['readableDate_start'];
    readableDateEnd = json['readableDate_end'];
    map = json['map'];
    code = json['code'];
    durationInSecs = json['DurationInSecs'];
    durationInMinutes = json['DurationInMinutes'];
  }
}
