import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pix_entities/pix_type_entity.dart';

class PixEntity extends Equatable {
  final int id;
  final String? key;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final PixTypeEntity? pixType;

  const PixEntity({
    required this.id,
    this.key,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.pixType
  });

  @override
  List<Object?> get props => [
        id,
        key,
        createdAt,
        updatedAt,
        deletedAt,
        pixType
      ];
}
