import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_entities/service_order_entity.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class ApproveServiceOrderByIdUsecase implements Usecase<ResponseEntity<ServiceOrderEntity>, ArgParams> {

  @override
  Future<Either<ApplicationError, ResponseEntity<ServiceOrderEntity>>> call(ArgParams argParams);
}