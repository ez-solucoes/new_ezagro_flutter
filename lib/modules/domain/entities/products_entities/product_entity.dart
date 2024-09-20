import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/products_entities/product_type_entity.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String description
  final String brand;
  final String productCode;
  final ProductTypeEntity productType;
  final String file;


  @override
  List<Object?> get props => throw UnimplementedError();
}