import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';

abstract class ProductUsecase
    implements Usecase<PaginationEntity<ProductEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<ProductEntity>>> call(
      NoParams params);
}
