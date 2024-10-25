import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/permissions_entities/permissions_entity.dart';

class GroupEntity extends Equatable {
  final int id;
  final String? name;
  final List<PermissionsEntity>? permissions;

  const GroupEntity({required this.id, this.name, this.permissions});

  @override
  List<Object?> get props => [id, name, permissions];
}