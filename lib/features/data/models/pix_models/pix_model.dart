import 'dart:convert';
import 'package:new_ezagro_flutter/features/data/models/pix_models/pix_type_model.dart';
import '../../../domain/entities/pix_entities/pix_entity.dart';

class PixModel extends PixEntity {
  const PixModel({
    required super.id,
    super.key,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.pixType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'key': key,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'pixType': (pixType as PixTypeModel).toMap(),
    };
  }

  factory PixModel.fromMap(Map<String, dynamic> map) {
    return PixModel(
      id: map['id'] as int,
      key: map['key'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
      pixType: map['pixType'] != null
          ? PixTypeModel.fromMap(map['pixType'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PixModel.fromJson(String source) =>
      PixModel.fromMap(json.decode(source) as Map<String, dynamic>);
}