import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';

import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/farm_datasource/farm_plot_datasources/farm_plot_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/plot_models/farm_plot_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../domain/repositories/farm_repositories/farm_plot_repositories/farm_plot_repository.dart';

class FarmPlotRepositoryImpl implements FarmPlotRepository {
  final FarmPlotDatasource datasource;

  FarmPlotRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<FarmPlotModel>>>>
      getAllFarmPlotsByFarmId(ArgParams argParams) async {
    try {
      final result = await datasource.getAllFarmPlotsByFarmId(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$FarmPlotRepositoryImpl.getAllFarmPlotsByFarmId',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<FarmPlotModel>>> getFarmPlotById(
      ArgParams argParams) async {
    try {
      final result = await datasource.getFarmPlotById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$FarmPlotRepositoryImpl.getFarmPlotById',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>>
      getAllFarmPlotsByFarmIdToSelect(ArgParams argParams) async {
    try {
      final result = await datasource.getAllFarmPlotsByFarmIdToSelect(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$FarmPlotRepositoryImpl.getAllFarmPlotsByFarmIdToSelect',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }
}
