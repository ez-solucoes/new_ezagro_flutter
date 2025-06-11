import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../entities/response_entities/response_entity.dart';

abstract class GetProductTypeByIdUsecase implements Usecase<ResponseEntity<ProductTypeEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<ProductTypeEntity>>> call(ArgParams params);
}