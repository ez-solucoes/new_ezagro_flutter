import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../entities/plot_entities/farm_plot_entity.dart';
import '../../../../entities/response_entities/response_entity.dart';
import '../../../../params/arg_params/arg_params.dart';

abstract class GetFarmPlotByIdUsecase implements Usecase<ResponseEntity<FarmPlotEntity>, ArgParams>{
  @override
  Future<Either<ApplicationError, ResponseEntity<FarmPlotEntity>>> call(ArgParams argParams);

}