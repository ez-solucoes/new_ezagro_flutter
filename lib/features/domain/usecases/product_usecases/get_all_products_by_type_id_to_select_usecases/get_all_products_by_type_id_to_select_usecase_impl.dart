import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/product_repositories/product_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/get_all_products_by_type_id_to_select_usecases/get_all_products_by_type_id_to_select_usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/response_entities/response_entity.dart';

class GetAllProductsByTypeIdToSelectUsecaseImpl implements GetAllProductsByTypeIdToSelectUsecase {
  final ProductRepository repository;

  GetAllProductsByTypeIdToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(ArgParams argParams) async {
    return await repository.getAllProductsByTypeIdToSelect(argParams);
  }
}