import 'dart:convert';
import '../../../domain/entities/selector_entities/selector_entity.dart';

class SelectorModel extends SelectorEntity {
  const SelectorModel({
    required super.id,
    super.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory SelectorModel.fromMap(Map<String, dynamic> map) {
    return SelectorModel(
      id: map['id'] as int,
      name: map['name'] as String?, // name is optional, so it can be null
    );
  }

  String toJson() => json.encode(toMap());

  factory SelectorModel.fromJson(String source) =>
      SelectorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}