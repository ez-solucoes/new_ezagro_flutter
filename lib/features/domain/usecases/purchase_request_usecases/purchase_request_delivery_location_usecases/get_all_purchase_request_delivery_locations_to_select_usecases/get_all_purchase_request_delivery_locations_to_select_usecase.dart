import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../entities/select_entities/select_entity.dart';

abstract class GetAllPurchaseRequestDeliveryLocationsToSelectUsecase implements Usecase<List<SelectEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(NoParams noParams);
}