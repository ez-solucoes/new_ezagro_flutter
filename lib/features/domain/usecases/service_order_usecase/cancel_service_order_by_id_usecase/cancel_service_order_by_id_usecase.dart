import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_entities/service_order_entity.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class CancelServiceOrderByIdUsecase implements Usecase<ServiceOrderEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, ServiceOrderEntity>> call(ArgParams argParams);
}
