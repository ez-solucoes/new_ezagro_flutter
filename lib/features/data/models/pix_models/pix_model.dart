import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/pix_models/pix_type_model.dart';
import '../../../domain/entities/pix_entities/pix_entity.dart';

class PixModel extends PixEntity {
  const PixModel({
    required super.id,
    super.pixType,
    super.pixKey,
    super.active,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'pixType': pixType == null ? null : (pixType as PixTypeModel).toMap(),
    'pixKey': pixKey,
    'active': active,
  };

  factory PixModel.fromMap(Map<String, dynamic> map) => PixModel(
    id: map['id'],
    pixType: map['pixType'] == null ? null : PixTypeModel.fromMap(map['pixType']),
    pixKey: map['pixKey'],
    active: map['active'],
  );

  String toJson() => json.encode(toMap());

  factory PixModel.fromJson(String source) =>
      PixModel.fromMap(json.decode(source));
}