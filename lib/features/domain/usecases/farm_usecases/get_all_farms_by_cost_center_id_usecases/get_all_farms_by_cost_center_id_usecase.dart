import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../entities/response_entities/response_entity.dart';

abstract class GetAllFarmsByCostCenterIdUsecase
    implements Usecase<ResponseEntity<List<FarmEntity>>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<FarmEntity>>>> call(
      ArgParams argParams);
}
