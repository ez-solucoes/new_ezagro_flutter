import 'dart:convert';
import '../../../domain/entities/local_time_entities/local_time_entity.dart';

class LocalTimeModel extends LocalTimeEntity {
  const LocalTimeModel({
    required super.hour,
    required super.minute,
    required super.second,
    required super.nano,
  });


  Map<String, dynamic> toMap() => {
    'hour': hour,
    'minute': minute,
    'second': second,
    'nano': nano,
  };

  factory LocalTimeModel.fromMap(Map<String, dynamic> map) => LocalTimeModel(
    hour: map['hour'],
    minute: map['minute'],
    second: map['second'],
    nano: map['nano'],
  );

  String toJson() => json.encode(toMap());

  factory LocalTimeModel.fromJson(String source)=>
      LocalTimeModel.fromMap(json.decode(source));
}