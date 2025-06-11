import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/cost_center_repositories/cost_center_repository.dart';
import 'get_all_cost_centers_by_cost_center_type_id_to_select_usecase.dart';

class GetAllCostCentersByCostCenterTypeIdToSelectUsecaseImpl implements GetAllCostCentersByCostCenterTypeIdToSelectUsecase{

  final CostCenterRepository repository;

  GetAllCostCentersByCostCenterTypeIdToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(ArgParams argParams) async {
    return await repository.getAllCostCentersByCostCenterTypeIdToSelect(argParams);
  }
}