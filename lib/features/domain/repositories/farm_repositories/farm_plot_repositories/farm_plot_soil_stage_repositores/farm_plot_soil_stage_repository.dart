import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../entities/response_entities/response_entity.dart';
import '../../../../entities/type_entities/type_entity.dart';
import '../../../../params/arg_params/arg_params.dart';

abstract class FarmPlotSoilStageRepository {
  Future<Either<ApplicationError, ResponseEntity<List<TypeEntity>>>> getAllFarmPlotSoilStages(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> getAllFarmPlotSoilStagesToSelect(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<TypeEntity>>> getFarmPlotSoilStageById(ArgParams argParams);
}