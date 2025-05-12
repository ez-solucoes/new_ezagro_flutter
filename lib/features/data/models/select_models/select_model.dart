import 'dart:convert';
import '../../../domain/entities/select_entities/select_entity.dart';

class SelectModel extends SelectEntity {
  const SelectModel({
    required super.value,
    super.label,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'label': label,
    };
  }

  factory SelectModel.fromMap(Map<String, dynamic> map) {
    return SelectModel(
      value: map['value'] as int,
      label: map['label'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory SelectModel.fromJson(String source) =>
      SelectModel.fromMap(json.decode(source) as Map<String, dynamic>);
}