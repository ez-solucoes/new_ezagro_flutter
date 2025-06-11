import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/purchase_request_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/response_entities/response_entity.dart';

abstract class GetPurchaseRequestByIdUsecase implements Usecase<ResponseEntity<PurchaseRequestEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<PurchaseRequestEntity>>> call(ArgParams argParams);
}
