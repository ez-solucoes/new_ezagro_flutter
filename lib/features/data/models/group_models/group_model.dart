import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/permissions_models/permissions_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/permissions_entities/permissions_entity.dart';

import '../../../domain/entities/group_entitites/group_entity.dart';

class GroupModel extends GroupEntity {
  const GroupModel({required super.id, super.name, super.permissions});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'permissions': permissions,
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      permissions: map['permissions'] == null ? null : List<PermissionsEntity>.from(map['permissions'].map((e) => PermissionsModel.fromMap(e))),
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupModel.fromJson(String source) =>
      GroupModel.fromMap(json.decode(source) as Map<String, dynamic>);
}