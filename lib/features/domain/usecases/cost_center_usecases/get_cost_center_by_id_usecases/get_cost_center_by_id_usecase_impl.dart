import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../repositories/cost_center_repositories/cost_center_repository.dart';
import 'get_cost_center_by_id_usecase.dart';

class GetCostCenterByIdUsecaseImpl implements GetCostCenterByIdUsecase {

  final CostCenterRepository repository;

  GetCostCenterByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<CostCenterEntity>>> call(ArgParams argParams) async {
    return await repository.getCostCenterById(argParams);
  }

}