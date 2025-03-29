import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/purchase_request_entities/purchase_request_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class CancelPurchaseRequestByIdUsecase
    implements Usecase<PurchaseRequestEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, PurchaseRequestEntity>> call(ArgParams argParams);
}
