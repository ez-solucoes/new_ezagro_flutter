import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/plot_models/plot_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../domain/repositories/plots_repositories/plots_repository.dart';
import '../../datasources/remote_datasource/plots_datasource/plots_datasource.dart';

class PlotsRepositoryImpl implements PlotsRepository {
  final PlotsDatasource datasource;

  PlotsRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<PlotModel>>>> getAllPlots(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllPlots(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PlotsRepositoryImpl.getAllPlots',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<PlotModel>>> getPlotById(
      ArgParams argParams) async {
    try {
      final result = await datasource.getPlotById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PlotsRepositoryImpl.getPlotById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>> getAllPlotsToSelect(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllPlotsToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PlotsRepositoryImpl.getAllPlotsToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<PlotModel>>>> getAllPlotsByFarmId(ArgParams argParams) async {
    try {
      final result = await datasource.getAllPlotsByFarmId(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PlotsRepositoryImpl.getAllPlotsByFarmId',
          additionalInfo: stacktrace.toString()));
    }
  }
}
