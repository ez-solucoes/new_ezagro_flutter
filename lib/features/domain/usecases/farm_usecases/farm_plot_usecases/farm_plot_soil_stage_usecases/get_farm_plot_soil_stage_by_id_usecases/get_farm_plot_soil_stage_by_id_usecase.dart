import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import '../../../../../../../core/errors/application_error.dart';
import '../../../../../entities/response_entities/response_entity.dart';
import '../../../../../entities/type_entities/type_entity.dart';
import '../../../../../params/arg_params/arg_params.dart';

abstract class GetFarmPlotSoilStageByIdUsecase implements Usecase<ResponseEntity<TypeEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<TypeEntity>>> call(ArgParams argParams);
}