import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../repositories/farm_repositories/farm_plot_repositories/farm_plot_soil_stage_repositores/farm_plot_soil_stage_repository.dart';
import 'get_farm_plot_soil_stage_by_id_usecase.dart';

class GetFarmPlotSoilStageByIdUsecaseImpl implements GetFarmPlotSoilStageByIdUsecase {
  final FarmPlotSoilStageRepository repository;

  GetFarmPlotSoilStageByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<TypeEntity>>> call(ArgParams argParams) async {
    return await repository.getFarmPlotSoilStageById(argParams);
  }
}