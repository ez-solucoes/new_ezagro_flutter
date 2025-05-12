import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/field_service_order_entities/field_service_order_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_entities/service_order_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/params/create_service_order_params/create_service_order_params.dart';

import '../../../../core/usecase/usecase.dart';

abstract class ServiceOrderRepository {

  Future<Either<ApplicationError, PaginationEntity<FieldServiceOrderEntity>>> getServiceOrderList(NoParams noParams);

  Future<Either<ApplicationError, FieldServiceOrderEntity>> createServiceOrder(MockParams mockParams);

  Future<Either<ApplicationError, ServiceOrderEntity>> getServiceOrderById(ArgParams params);

  Future<Either<ApplicationError, List<ServiceOrderEntity>>> getServiceOrderByStatusId(ArgParams params);

  Future<Either<ApplicationError, ServiceOrderEntity>> approveServiceOrderById(ArgParams params);

  Future<Either<ApplicationError, ServiceOrderEntity>> cancelServiceOrderById(ArgParams params);
}