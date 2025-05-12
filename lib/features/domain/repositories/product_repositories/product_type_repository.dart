import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../params/arg_params/arg_params.dart';

abstract class ProductTypeRepository {
  Future<Either<ApplicationError, List<ProductTypeEntity>>> getAllProductTypes(NoParams noParams);
  Future<Either<ApplicationError, List<SelectEntity>>> getAllProductTypesToSelect(NoParams noParams);
  Future<Either<ApplicationError, List<SelectEntity>>> getFilteredProductTypesToSelect(ArgParams argParams);
  Future<Either<ApplicationError, ProductTypeEntity>> getProductTypeById(ArgParams argParams);

}