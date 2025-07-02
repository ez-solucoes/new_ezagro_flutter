import 'package:equatable/equatable.dart';

class StockItemEntity extends Equatable {
  final int id;
  final String? expiresAt;
  final String? alertQuantity;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const StockItemEntity({
    required this.id,
    required this.expiresAt,
    required this.alertQuantity,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  @override
  List<Object?> get props => [
    id,
    expiresAt,
    alertQuantity,
    createdAt,
    updatedAt,
    deletedAt,
  ];

}