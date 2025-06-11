import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/cost_center_repositories/cost_center_repository.dart';
import 'get_all_cost_centers_to_select_usecase.dart';

class GetAllCostCentersToSelectUsecaseImpl implements GetAllCostCentersToSelectUsecase{
  final CostCenterRepository repository;

  GetAllCostCentersToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(NoParams noParams) async {
    return await repository.getAllCostCentersToSelect(noParams);
  }
}