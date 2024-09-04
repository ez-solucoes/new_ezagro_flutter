

import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_list_entities/service_order_list_entity.dart';

abstract class ServiceOrderListUsecase implements Usecase<List<ServiceOrderListEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<ServiceOrderListEntity>>> call(NoParams params);
}