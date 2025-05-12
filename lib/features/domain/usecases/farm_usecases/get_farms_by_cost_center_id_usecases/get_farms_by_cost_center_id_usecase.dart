import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';

abstract class GetFarmsByCostCenterIdUsecase
    implements Usecase<List<FarmEntity>, String> {
  @override
  Future<Either<ApplicationError, List<FarmEntity>>> call(
      String costCenterId);
}
