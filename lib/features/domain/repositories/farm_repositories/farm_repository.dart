import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../../params/arg_params/arg_params.dart';

abstract class FarmRepository {
  Future<Either<ApplicationError, ResponseEntity<List<FarmEntity>>>> getAllFarms(
      NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<FarmEntity>>> getFarmById(
      ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<FarmEntity>>>>
      getAllFarmsByCostCenterId(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllFarmsToSelect(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllFarmsByCostCenterIdToSelect(ArgParams argParams);
}
