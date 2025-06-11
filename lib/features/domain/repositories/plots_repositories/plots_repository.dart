import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../../params/arg_params/arg_params.dart';

abstract class PlotsRepository {
  Future<Either<ApplicationError, ResponseEntity<List<PlotEntity>>>> getAllPlots(
      NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<List<PlotEntity>>>> getAllPlotsByFarmId(
      ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllPlotsToSelect(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<PlotEntity>>> getPlotById(
      ArgParams argParams);
}
