import 'dart:convert';
import '../../../domain/entities/outsource_entities/outsource_status_entity.dart';

class OutsourceStatusModel extends OutsourceStatusEntity {
  const OutsourceStatusModel({
    required super.id,
    required super.name,
  });

  String toJson() => json.encode(toMap());

  factory OutsourceStatusModel.fromJson(String source) =>
      OutsourceStatusModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  factory OutsourceStatusModel.fromMap(Map<String, dynamic> map) =>
      OutsourceStatusModel(
        id: map['id'],
        name: map['name'],
      );
}
