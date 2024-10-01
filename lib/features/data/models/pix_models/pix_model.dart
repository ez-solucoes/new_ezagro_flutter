import 'package:new_ezagro_flutter/features/data/models/pix_models/pix_type_model.dart';
import '../../../domain/entities/pix_entities/pix_entity.dart';

class PixModel extends PixEntity {
  const PixModel({
    required super.id,
    required super.pixType,
    required super.pixKey,
    required super.active,
  });

  factory PixModel.fromJson(Map<String, dynamic> json) => PixModel(
    id: json['id'],
    pixType: PixTypeModel.fromJson(json['pixType']),
    pixKey: json['pixKey'],
    active: json['active'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'pixType': (pixType as PixTypeModel).toJson(),
    'pixKey': pixKey,
    'active': active,
  };

  Map<String, dynamic> toMap() => {
    'id': id,
    'pixType': (pixType as PixTypeModel).toMap(),
    'pixKey': pixKey,
    'active': active,
  };

  factory PixModel.fromMap(Map<String, dynamic> map) => PixModel(
    id: map['id'],
    pixType: PixTypeModel.fromMap(map['pixType']),
    pixKey: map['pixKey'],
    active: map['active'],
  );
}