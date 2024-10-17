import 'dart:convert';

import '../../../domain/entities/business_category_entities/business_category_entity.dart';

class BusinessCategoryModel extends BusinessCategoryEntity {
  const BusinessCategoryModel({
    required super.id,
    super.description,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'description': description,
  };

  factory BusinessCategoryModel.fromMap(Map<String, dynamic> map) =>
      BusinessCategoryModel(
        id: map['id'],
        description: map['description'],
      );

  String toJson() => json.encode(toMap());

  factory BusinessCategoryModel.fromJson(String source) =>
      BusinessCategoryModel.fromMap(json.decode(source));
}