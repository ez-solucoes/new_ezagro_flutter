import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/service_order_repositories/service_order_repository.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../entities/service_order_entities/service_order_entity.dart';
import 'create_service_order_usecase.dart';

class CreateServiceOrderUsecaseImpl implements CreateServiceOrderUsecase {
  ServiceOrderRepository repository;

  CreateServiceOrderUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<ServiceOrderEntity>>> call(
      ArgParams argParams) async {
    return await repository.createServiceOrder(argParams);
  }
}
