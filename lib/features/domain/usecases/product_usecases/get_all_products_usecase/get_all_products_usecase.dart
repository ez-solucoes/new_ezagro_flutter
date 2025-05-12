import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';

abstract class GetAllProductsUsecase
    implements Usecase<List<ProductEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<ProductEntity>>> call(
      NoParams params);
}
