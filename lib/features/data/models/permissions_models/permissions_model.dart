import 'dart:convert';

import '../../../domain/entities/permissions_entities/permissions_entity.dart';

class PermissionsModel extends PermissionsEntity {
  const PermissionsModel({
    required super.id,
    super.name,
    super.slug,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
    };
  }

  factory PermissionsModel.fromMap(Map<String, dynamic> map) {
    return PermissionsModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory PermissionsModel.fromJson(String source) =>
      PermissionsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}