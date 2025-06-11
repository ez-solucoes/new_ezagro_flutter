import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../params/arg_params/arg_params.dart';

abstract class ProductTypeRepository {
  Future<Either<ApplicationError, ResponseEntity<List<ProductTypeEntity>>>> getAllProductTypes(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> getAllProductTypesToSelect(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<ProductTypeEntity>>> getProductTypeById(ArgParams argParams);

}