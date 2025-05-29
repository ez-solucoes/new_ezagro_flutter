import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/application_error.dart';

abstract class GetAllCostCentersByCostCenterTypeIdUsecase implements Usecase<List<CostCenterEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, List<CostCenterEntity>>> call(ArgParams argParams);
}