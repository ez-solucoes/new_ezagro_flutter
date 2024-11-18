import 'dart:convert';

import '../../../domain/entities/company_entities/company_type_entity.dart';

class CompanyTypeModel extends CompanyTypeEntity {
  const CompanyTypeModel({
    required super.id,
    super.name,
    super.description,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
      };

  factory CompanyTypeModel.fromMap(Map<String, dynamic> map) =>
      CompanyTypeModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
      );

  String toJson() => json.encode(toMap());

  factory CompanyTypeModel.fromJson(String source) =>
      CompanyTypeModel.fromMap(json.decode(source));
}
