import 'package:equatable/equatable.dart';

class CropEntity extends Equatable {
  final int id;
  final String? name;
  final String? slug;
  final bool? isPerennial;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? description;
  final bool? active;

  const CropEntity({
    required this.id,
    this.name,
    this.description,
    this.active,
    this.slug,
    this.isPerennial,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        active,
        slug,
        isPerennial,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
