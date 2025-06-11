import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/farm_plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../entities/response_entities/response_entity.dart';

abstract class GetAllFarmPlotsUsecase implements Usecase<ResponseEntity<List<FarmPlotEntity>>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<FarmPlotEntity>>>> call(ArgParams argParams);

}