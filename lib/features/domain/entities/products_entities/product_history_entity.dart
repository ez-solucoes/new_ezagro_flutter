import 'package:equatable/equatable.dart';

class ProductHistoryEntity extends Equatable {
  final int productHistoryId;
  final int productId;
  final String name;
  final String description;
  final String brand;
  final String productCode;

  const ProductHistoryEntity({
    required this.productHistoryId,
    required this.productId,
    required this.name,
    required this.description,
    required this.brand,
    required this.productCode,
  });

  @override
  List<Object?> get props => [
        productHistoryId,
        productId,
        name,
        description,
        brand,
        productCode,
      ];
}
