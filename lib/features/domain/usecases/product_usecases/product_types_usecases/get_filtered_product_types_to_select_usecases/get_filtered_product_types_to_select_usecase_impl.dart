import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/product_repositories/product_type_repository.dart';

import 'get_filtered_product_types_to_select_usecase.dart';

class GetFilteredProductTypesToSelectUsecaseImpl implements GetFilteredProductTypesToSelectUsecase {
  final ProductTypeRepository repository;

  GetFilteredProductTypesToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(ArgParams argParams) async {
    return await repository.getFilteredProductTypesToSelect(argParams);
  }
}