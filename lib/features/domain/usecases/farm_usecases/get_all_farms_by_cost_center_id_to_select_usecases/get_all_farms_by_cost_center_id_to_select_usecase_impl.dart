import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/farm_repositories/farm_repository.dart';
import 'get_all_farms_by_cost_center_id_to_select_usecase.dart';

class GetAllFarmsByCostCenterIdToSelectUsecaseImpl implements GetAllFarmsByCostCenterIdToSelectUsecase {
  final FarmRepository repository;

  GetAllFarmsByCostCenterIdToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(ArgParams argParams) async {
    return await repository.getAllFarmsByCostCenterIdToSelect(argParams);
  }

}