import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/purchase_request_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';

abstract  class ApprovePurchaseRequestByIdUsecase implements Usecase<PurchaseRequestEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, PurchaseRequestEntity>> call(ArgParams argParams);
}