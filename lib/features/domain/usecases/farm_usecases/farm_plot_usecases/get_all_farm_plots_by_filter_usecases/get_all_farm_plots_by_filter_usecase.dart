import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/farm_plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../params/arg_params/arg_params.dart';

abstract class GetAllFarmPlotsByFilterUsecase implements Usecase<ResponseEntity<List<FarmPlotEntity>>, ArgParams>{
  @override
  Future<Either<ApplicationError, ResponseEntity<List<FarmPlotEntity>>>> call(ArgParams argParams);
}