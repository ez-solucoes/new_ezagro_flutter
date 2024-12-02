import 'package:equatable/equatable.dart';

class SegmentEntity extends Equatable {
  final int id;
  final String? name;
  final String? slug;
  final bool? isServiceProvider;
  final bool? isProductSupplier;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const SegmentEntity({
    required this.id,
    this.name,
    this.slug,
    this.isServiceProvider,
    this.isProductSupplier,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    isServiceProvider,
    isProductSupplier,
    createdAt,
    updatedAt,
    deletedAt,
  ];
}