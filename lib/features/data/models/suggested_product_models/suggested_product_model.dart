import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/measurement_unit_type_model/measurement_unit_type_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/suggested_product_entities/suggested_product_entity.dart';

import '../type_models/type_model.dart';

class SuggestedProductModel extends SuggestedProductEntity {
  const SuggestedProductModel({
    required super.id,
    super.trademark,
    super.description,
    super.registrationHolder,
    super.imageUrl,
    super.slug,
    super.isActive,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.type,
    super.measurementUnit,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'trademark': trademark,
    'description': description,
    'registrationHolder': registrationHolder,
    'imageUrl': imageUrl,
    'slug': slug,
    'isActive': isActive,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'deletedAt': deletedAt,
    'type': type,
    'measurementUnit': measurementUnit,
  };

  factory SuggestedProductModel.fromMap(Map<String, dynamic> map) => SuggestedProductModel(
    id: map['id'],
    trademark: map['trademark'],
    description: map['description'],
    registrationHolder: map['registrationHolder'],
    imageUrl: map['imageUrl'],
    slug: map['slug'],
    isActive: map['isActive'],
    createdAt: map['createdAt'],
    updatedAt: map['updatedAt'],
    deletedAt: map['deletedAt'],
    type: map['type'] == null ? null : TypeModel.fromMap(map['type']),
    measurementUnit: map['measurementUnit'] == null ? null : MeasurementUnitTypeModel.fromMap(map['measurementUnit']),
  );

  String toJson() => json.encode(toMap());

  factory SuggestedProductModel.fromJson(String source) => SuggestedProductModel.fromMap(json.decode(source));

}