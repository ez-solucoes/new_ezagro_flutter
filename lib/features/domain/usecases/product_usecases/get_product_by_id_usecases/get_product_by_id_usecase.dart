import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class GetProductByIdUsecase implements Usecase<ResponseEntity<ProductEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<ProductEntity>>> call(ArgParams params);

}