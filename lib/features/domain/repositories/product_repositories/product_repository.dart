import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../../entities/select_entities/select_entity.dart';
import '../../params/arg_params/arg_params.dart';

abstract class ProductRepository {
  Future<Either<ApplicationError, List<ProductEntity>>> getAllProducts(NoParams noParams);
  Future<Either<ApplicationError, List<SelectEntity>>> getAllProductsToSelect(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<ProductEntity>>> getProductById(ArgParams argParams);
  Future<Either<ApplicationError, List<ProductEntity>>> getAllProductsByTypeId(ArgParams argParams);
  Future<Either<ApplicationError, List<SelectEntity>>> getAllProductsByTypeIdToSelect(ArgParams argParams);
}
