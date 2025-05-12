import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/access_groups_models/access_groups_model.dart';
import 'package:new_ezagro_flutter/features/data/models/client_models/client_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/user_entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.id,
    required super.whatsappPhone,
    required super.username,
    required super.password,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    super.isResetPassword,
    super.isFirstLogin,
    super.client,
    super.accessGroups,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'whatsappPhone': whatsappPhone,
      'username': username,
      'password': password,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'isResetPassword': isResetPassword,
      'isFirstLogin': isFirstLogin,
      'client': client,
      'accessGroups': accessGroups,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] == null ? null : map['id'] as int,
      whatsappPhone: map['whatsappPhone'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      isActive: map['isActive'] as bool,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
      isResetPassword: map['isResetPassword'] == null ? null : map['isResetPassword'] as bool,
      isFirstLogin: map['isFirstLogin'] == null ? null : map['isFirstLogin'] as bool,
      client: map['client'] == null ? null : ClientModel.fromMap(map['client']),
      accessGroups: map['accessGroups'] != null ? (map['accessGroups'] as List).map((e) => AccessGroupsModel.fromMap(e)).toList() : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
