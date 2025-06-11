import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class GetAllPlotsByFarmIdUsecase
    implements Usecase<ResponseEntity<List<PlotEntity>>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<PlotEntity>>>> call(
      ArgParams argParams);
}
