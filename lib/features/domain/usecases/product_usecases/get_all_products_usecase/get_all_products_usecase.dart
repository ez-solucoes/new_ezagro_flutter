import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';

import '../../../entities/response_entities/response_entity.dart';

abstract class GetAllProductsUsecase
    implements Usecase<ResponseEntity<List<ProductEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<ProductEntity>>>> call(
      NoParams params);
}
