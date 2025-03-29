import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    createdAt,
    updatedAt,
    deletedAt,
  ];


}