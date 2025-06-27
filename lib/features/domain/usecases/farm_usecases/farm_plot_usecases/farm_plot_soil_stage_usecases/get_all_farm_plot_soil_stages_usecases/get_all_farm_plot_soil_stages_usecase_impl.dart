import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import '../../../../../repositories/farm_repositories/farm_plot_repositories/farm_plot_soil_stage_repositores/farm_plot_soil_stage_repository.dart';
import 'get_all_farm_plot_soil_stages_usecase.dart';

class GetAllFarmPlotSoilStagesUsecaseImpl implements GetAllFarmPlotSoilStagesUsecase {
  final FarmPlotSoilStageRepository repository;

  GetAllFarmPlotSoilStagesUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<TypeEntity>>>> call(NoParams noParams) async {
    return await repository.getAllFarmPlotSoilStages(noParams);
  }
}