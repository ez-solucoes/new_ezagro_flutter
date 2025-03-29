import 'package:equatable/equatable.dart';

class PurchaseRequestTypeEntity extends Equatable {
  final int id;
  final String? name;
  final String? slug;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const PurchaseRequestTypeEntity({
    required this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.deletedAt
  });

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    createdAt,
    updatedAt,
    deletedAt
  ];
}