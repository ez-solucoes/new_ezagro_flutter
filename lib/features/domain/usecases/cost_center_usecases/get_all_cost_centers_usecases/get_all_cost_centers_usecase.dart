import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';

import '../../../../../core/errors/application_error.dart';

abstract class GetAllCostCentersUsecase implements Usecase<List<CostCenterEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<CostCenterEntity>>> call(NoParams noParams);
}