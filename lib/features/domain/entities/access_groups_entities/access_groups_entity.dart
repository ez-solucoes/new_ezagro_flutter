import 'package:equatable/equatable.dart';

import '../permissions_entities/permissions_entity.dart';

class AccessGroupsEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final PermissionsEntity permissions;

  const AccessGroupsEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.permissions,
  });

  @override
  List<Object?> get props => [id, name, slug, permissions];
}
