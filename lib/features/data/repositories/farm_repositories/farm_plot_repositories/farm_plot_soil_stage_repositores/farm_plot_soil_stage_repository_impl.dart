import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/data/models/type_models/type_model.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../../core/errors/generic_error.dart';
import '../../../../../domain/repositories/farm_repositories/farm_plot_repositories/farm_plot_soil_stage_repositores/farm_plot_soil_stage_repository.dart';
import '../../../../datasources/remote_datasource/farm_datasource/farm_plot_datasources/farm_plot_soil_stage_datasources/farm_plot_soil_stage_datasource.dart';

class FarmPlotSoilStageRepositoryImpl implements FarmPlotSoilStageRepository {
  final FarmPlotSoilStageDatasource datasource;

  FarmPlotSoilStageRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<TypeModel>>>>
      getAllFarmPlotSoilStages(NoParams noParams) async {
    try {
      final result = await datasource.getAllFarmPlotSoilStages(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$FarmPlotSoilStageRepositoryImpl.getAllFarmPlotSoilStages',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>>
      getAllFarmPlotSoilStagesToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllFarmPlotSoilStagesToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$FarmPlotSoilStageRepositoryImpl.getAllFarmPlotSoilStagesToSelect',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<TypeModel>>> getFarmPlotSoilStageById(
      ArgParams argParams) async {
    try {
      final result = await datasource.getFarmPlotSoilStageById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$FarmPlotSoilStageRepositoryImpl.getFarmPlotSoilStageById',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }
}
