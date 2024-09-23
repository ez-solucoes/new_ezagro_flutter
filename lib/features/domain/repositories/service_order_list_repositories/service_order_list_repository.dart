import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_list_entities/service_order_list_entity.dart';

import '../../../../core/usecase/usecase.dart';

abstract class ServiceOrderListRepository {
  Future<Either<ApplicationError, PaginationEntity<ServiceOrderListEntity>>> getServiceOrderList(NoParams noParams);
}