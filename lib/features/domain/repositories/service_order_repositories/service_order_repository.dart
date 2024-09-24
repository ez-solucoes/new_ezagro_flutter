import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/mockEntity/mock_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_list_entities/service_order_list_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/create_service_order_params/create_service_order_params.dart';

import '../../../../core/usecase/usecase.dart';

abstract class ServiceOrderRepository {

  Future<Either<ApplicationError, PaginationEntity<ServiceOrderListEntity>>> getServiceOrderList(NoParams noParams);

  Future<Either<ApplicationError, MockEntity>> createServiceOrder(MockParams mockParams);
}