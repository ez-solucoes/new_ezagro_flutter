import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/farm_plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import '../../../entities/select_entities/select_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class FarmPlotRepository {
  Future<Either<ApplicationError, List<FarmPlotEntity>>> getAllFarmPlots(ArgParams argParams);
  Future<Either<ApplicationError, List<SelectEntity>>> getAllFarmPlotsToSelect(ArgParams argParams);
  Future<Either<ApplicationError, ResponseEntity<FarmPlotEntity>>> getFarmPlotById(ArgParams argParams);
}