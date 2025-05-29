import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/cost_center_entities/cost_center_entity.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class GetCostCenterByIdUsecase
    implements Usecase<ResponseEntity<CostCenterEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<CostCenterEntity>>> call(
      ArgParams argParams);
}
