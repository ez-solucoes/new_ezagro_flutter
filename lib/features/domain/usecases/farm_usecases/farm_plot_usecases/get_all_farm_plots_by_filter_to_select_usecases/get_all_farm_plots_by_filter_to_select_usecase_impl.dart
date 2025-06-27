import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../repositories/farm_repositories/farm_plot_repositories/farm_plot_repository.dart';
import 'get_all_farm_plots_by_filter_to_select_usecase.dart';

class GetAllFarmPlotsByFilterToSelectUsecaseImpl implements GetAllFarmPlotsByFilterToSelectUsecase{
  final FarmPlotRepository repository;

  GetAllFarmPlotsByFilterToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(ArgParams argParams) async {
    return await repository.getAllFarmPlotsByFilterToSelect(argParams);
  }
}