import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../entities/service_order_entities/service_order_entity.dart';

abstract class CreateServiceOrderUsecase
    implements Usecase<ResponseEntity<ServiceOrderEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<ServiceOrderEntity>>> call(
      ArgParams argParams);
}
