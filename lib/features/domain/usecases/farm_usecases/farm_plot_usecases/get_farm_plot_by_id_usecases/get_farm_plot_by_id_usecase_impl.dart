import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/farm_plot_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../repositories/farm_repositories/farm_plot_repositories/farm_plot_repository.dart';
import 'get_farm_plot_by_id_usecase.dart';

class GetFarmPlotByIdUsecaseImpl implements GetFarmPlotByIdUsecase {
  final FarmPlotRepository repository;

  GetFarmPlotByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<FarmPlotEntity>>> call(ArgParams argParams) async {
    return await repository.getFarmPlotById(argParams);
  }
}