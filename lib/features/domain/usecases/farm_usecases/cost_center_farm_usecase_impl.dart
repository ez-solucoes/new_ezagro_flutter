import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import '../../repositories/farm_repositories/farm_repository.dart';
import 'cost_center_farm_usecase.dart';

class CostCenterFarmUsecaseImpl implements CostCenterFarmUsecase {
  final FarmRepository repository;

  CostCenterFarmUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<FarmEntity>>> call(
      String costCenterId) async {
    return await repository.getCostCenterFarms(costCenterId);
  }
}
