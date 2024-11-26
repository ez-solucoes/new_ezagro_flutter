import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/plot_models/plot_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../domain/repositories/plots_repositories/plots_repository.dart';
import '../../datasources/remote_datasource/plots_datasource/plots_datasource.dart';
import '../../models/pagination_model/pagination_model.dart';

class PlotsRepositoryImpl implements PlotsRepository {
  final PlotsDatasource datasource;

  PlotsRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<PlotModel>>> getPlots(
      NoParams noParams) async {
    try {
      final result = await datasource.getPlots(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PlotsRepositoryImpl.getPlots',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, PaginationModel<PlotModel>>> getPlotsByFarmId(
      ArgParams params) async {
    try {
      final result = await datasource.getPlotByFarmId(params);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PlotsRepositoryImpl.getPlotsByFarmdId',
          additionalInfo: stacktrace.toString()));
    }
  }
}
