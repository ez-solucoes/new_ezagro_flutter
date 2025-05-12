import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/category_entities/category_entity.dart';

class TypeEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final CategoryEntity? category;

  const TypeEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.category,
  });

  @override
  List<Object?> get props => [];

}