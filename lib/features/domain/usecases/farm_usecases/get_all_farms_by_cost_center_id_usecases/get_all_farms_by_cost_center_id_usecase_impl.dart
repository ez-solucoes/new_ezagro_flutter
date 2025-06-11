import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../params/arg_params/arg_params.dart';
import '../../../repositories/farm_repositories/farm_repository.dart';
import 'get_all_farms_by_cost_center_id_usecase.dart';

class GetAllFarmsByCostCenterIdUsecaseImpl
    implements GetAllFarmsByCostCenterIdUsecase {
  final FarmRepository repository;

  GetAllFarmsByCostCenterIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<FarmEntity>>>> call(
      ArgParams argParams) async {
    return await repository.getAllFarmsByCostCenterId(argParams);
  }
}
