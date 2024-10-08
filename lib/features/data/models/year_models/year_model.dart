import 'dart:convert';

import '../../../domain/entities/year_entities/year_entity.dart';

class YearModel extends YearEntity {
  const YearModel({
    required super.value,
    required super.leap,
  });

  String toJson() => json.encode(toMap());

  factory YearModel.fromJson(String source) =>
      YearModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'value': value,
        'leap': leap,
      };

  factory YearModel.fromMap(Map<String, dynamic> map) => YearModel(
        value: map['value'],
        leap: map['leap'],
      );
}
