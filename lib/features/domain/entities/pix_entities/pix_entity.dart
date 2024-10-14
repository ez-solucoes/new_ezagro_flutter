import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pix_entities/pix_type_entity.dart';

class PixEntity extends Equatable {
  final int id;
  final PixTypeEntity pixType;
  final String pixKey;
  final bool active;

  const PixEntity({
    required this.id,
    required this.pixType,
    required this.pixKey,
    required this.active,
  });

  @override
  List<Object?> get props => [
        id,
        pixType,
        pixKey,
        active,
      ];
}
