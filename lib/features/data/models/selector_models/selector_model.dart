import 'dart:convert';
import '../../../domain/entities/selector_entities/selector_entity.dart';

class SelectorModel extends SelectorEntity {
  const SelectorModel({
    required super.value,
    super.label});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'label': label,
    };
  }

  factory SelectorModel.fromMap(Map<String, dynamic> map) {
    return SelectorModel(
      value: map['value'] as int,
      label: map['label'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory SelectorModel.fromJson(String source) =>
      SelectorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}