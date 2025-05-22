import 'package:equatable/equatable.dart';

class AgriculturalSubActivityEntity extends Equatable {
  final int id;
  final String? name;
  final String? description;
  final bool? isDefault;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const AgriculturalSubActivityEntity({
    required this.id,
    this.name,
    this.description,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        isDefault,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
