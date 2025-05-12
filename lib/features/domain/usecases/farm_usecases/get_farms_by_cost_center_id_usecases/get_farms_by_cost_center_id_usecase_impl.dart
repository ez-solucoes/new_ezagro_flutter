import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import '../../../repositories/farm_repositories/farm_repository.dart';
import 'get_farms_by_cost_center_id_usecase.dart';

class GetFarmsByCostCenterIdUsecaseImpl
    implements GetFarmsByCostCenterIdUsecase {
  final FarmRepository repository;

  GetFarmsByCostCenterIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<FarmEntity>>> call(
      String costCenterId) async {
    return await repository.getFarmsByCostCenterId(costCenterId);
  }
}
