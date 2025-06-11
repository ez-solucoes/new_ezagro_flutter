import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';


import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/farm_plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/farm_repositories/farm_plot_repositories/farm_plot_repository.dart';

import '../../../../entities/response_entities/response_entity.dart';
import 'get_all_farm_plots_usecase.dart';

class GetAllFarmPlotsUsecaseImpl implements GetAllFarmPlotsUsecase{
  final FarmPlotRepository repository;

  GetAllFarmPlotsUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<FarmPlotEntity>>>> call(ArgParams argParams) async {
    return await repository.getAllFarmPlotsByFarmId(argParams);
  }
}