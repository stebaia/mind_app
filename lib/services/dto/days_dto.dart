import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class DaysDTO extends DTO with EquatableMixin {
  int? count;
  List<DayDTO>? days;

  DaysDTO({this.count, this.days});

  DaysDTO.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['days'] != null) {
      days = <DayDTO>[];
      json['days'].forEach((v) {
        days!.add(new DayDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [count, days];
}

class DayDTO extends DTO with EquatableMixin {
  String? mood;
  String? day;
  String? note;
  List<String>? tags;

  DayDTO({this.mood, this.day, this.note, this.tags});

  DayDTO.fromJson(Map<String, dynamic> json) {
    mood = json['mood'];
    day = json['day'];
    note = json['note'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mood'] = this.mood;
    data['day'] = this.day;
    data['note'] = this.note;
    data['tags'] = this.tags;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [mood, day, note, tags];
}

class DayResultDTO extends DTO with EquatableMixin {
  DayDTO? dayDTO;

  DayResultDTO({this.dayDTO});

  DayResultDTO.fromJson(Map<String, dynamic> json) {
    dayDTO = json['day'] != null ? new DayDTO.fromJson(json['day']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dayDTO != null) {
      data['day'] = this.dayDTO!.toJson();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [dayDTO];
}
