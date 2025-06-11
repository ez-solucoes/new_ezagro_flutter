import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/plots_repositories/plots_repository.dart';

import 'get_plot_by_id_usecase.dart';

class GetPlotByIdUsecaseImpl implements GetPlotByIdUsecase {
  final PlotsRepository repository;

  const GetPlotByIdUsecaseImpl(this.repository);
  @override
  Future<Either<ApplicationError, ResponseEntity<PlotEntity>>> call(ArgParams argParams) async {
    return await repository.getPlotById(argParams);
  }
}