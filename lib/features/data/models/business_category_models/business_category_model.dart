import '../../../domain/entities/business_category_entities/business_category_entity.dart';

class BusinessCategoryModel extends BusinessCategoryEntity {
  const BusinessCategoryModel({
    required super.id,
    required super.description,
  });

  factory BusinessCategoryModel.fromJson(Map<String, dynamic> json) =>
      BusinessCategoryModel(
        id: json['id'],
        description: json['description'],
      );Map<String, dynamic> toJson() => {
    'id': id,
    'description': description,
  };

  Map<String, dynamic> toMap() => {
    'id': id,
    'description': description,
  };

  factory BusinessCategoryModel.fromMap(Map<String, dynamic> map) =>
      BusinessCategoryModel(
        id: map['id'],
        description: map['description'],
      );
}