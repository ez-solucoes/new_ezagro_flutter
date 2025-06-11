import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/cost_center_repositories/cost_center_repository.dart';
import 'get_all_cost_centers_usecase.dart';

class GetAllCostCentersUsecaseImpl implements GetAllCostCentersUsecase {
  final CostCenterRepository repository;

  GetAllCostCentersUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<CostCenterEntity>>>> call(NoParams noParams) async {
    return await repository.getAllCostCenters(noParams);
  }
}