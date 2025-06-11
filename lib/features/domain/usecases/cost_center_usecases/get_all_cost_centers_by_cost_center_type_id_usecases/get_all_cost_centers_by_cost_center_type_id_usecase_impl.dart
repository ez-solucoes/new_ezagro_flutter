import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/cost_center_repositories/cost_center_repository.dart';
import 'get_all_cost_centers_by_cost_center_type_id_usecase.dart';

class GetAllCostCentersByCostCenterTypeIdUsecaseImpl implements GetAllCostCentersByCostCenterTypeIdUsecase{
  final CostCenterRepository repository;

  GetAllCostCentersByCostCenterTypeIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<CostCenterEntity>>>> call(ArgParams argParams) async {
    return await repository.getAllCostCentersByCostCenterTypeId(argParams);
  }
}