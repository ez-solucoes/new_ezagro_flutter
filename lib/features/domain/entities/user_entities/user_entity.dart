import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/access_groups_entities/access_groups_entity.dart';

import '../client_entities/client_entity.dart';

class UserEntity extends Equatable {
  final int? id;
  final String whatsappPhone;
  final String username;
  final String password;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final bool? isResetPassword;
  final bool? isFirstLogin;
  final ClientEntity? client;
  final List<AccessGroupsEntity>? accessGroups;

  const UserEntity({
    this.id,
    required this.whatsappPhone,
    required this.username,
    required this.password,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.isResetPassword,
    this.isFirstLogin,
    this.client,
    this.accessGroups,
  });

  @override
  List<Object?> get props =>[
    id,
    whatsappPhone,
    username,
    password,
    isActive,
    createdAt,
    updatedAt,
    deletedAt,
    isResetPassword,
    isFirstLogin,
    client,
    accessGroups,
  ];
}
