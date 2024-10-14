import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/field_service_order_entities/field_service_order_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/create_service_order_params/create_service_order_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/service_order_repositories/service_order_repository.dart';

import 'create_service_order_usecase.dart';

class CreateServiceOrderUsecaseImpl implements CreateServiceOrderUsecase {

  ServiceOrderRepository repository;

  CreateServiceOrderUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, FieldServiceOrderEntity>> call(MockParams mockParams) async {
    return await repository.createServiceOrder(mockParams);
  }
}