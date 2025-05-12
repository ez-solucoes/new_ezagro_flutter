import 'package:new_ezagro_flutter/features/domain/entities/access_groups_entities/access_groups_entity.dart';

import '../permissions_models/permissions_model.dart';

class AccessGroupsModel extends AccessGroupsEntity {
  const AccessGroupsModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.permissions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
      'permissions': permissions,
    };
  }

  factory AccessGroupsModel.fromMap(Map<String, dynamic> map) {
    return AccessGroupsModel(
      id: map['id'] as int,
      name: map['name'] as String,
      slug: map['slug'] as String,
      permissions: (map['permissions'] as List).map((e) => PermissionsModel.fromMap(e)).toList(),
    );
  }
}
