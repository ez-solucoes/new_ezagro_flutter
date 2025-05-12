import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';

abstract class GetAllProductsByTypeIdUsecase implements Usecase<List<ProductEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, List<ProductEntity>>> call(ArgParams params);
}