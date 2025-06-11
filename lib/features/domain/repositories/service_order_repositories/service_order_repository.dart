import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_entities/service_order_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../core/usecase/usecase.dart';

abstract class ServiceOrderRepository {
  Future<Either<ApplicationError, ResponseEntity<List<ServiceOrderEntity>>>>
      getAllServiceOrders(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllServiceOrdersToSelect(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<ServiceOrderEntity>>> createServiceOrder(
      ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<ServiceOrderEntity>>>
      getServiceOrderById(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<ServiceOrderEntity>>>>
      getAllServiceOrdersByStatusId(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<ServiceOrderEntity>>>
      approveServiceOrderById(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<ServiceOrderEntity>>>
      cancelServiceOrderById(ArgParams argParams);
}
