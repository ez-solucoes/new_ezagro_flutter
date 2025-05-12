import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/product_repositories/product_type_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/product_types_usecases/get_product_type_by_id_usecases/get_product_type_by_id_usecase.dart';

import '../../../../params/arg_params/arg_params.dart';

class GetProductTypeByIdUsecaseImpl implements GetProductTypeByIdUsecase {
  final ProductTypeRepository repository;

  GetProductTypeByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ProductTypeEntity>> call(ArgParams argParams) async {
    return await repository.getProductTypeById(argParams);
  }


}