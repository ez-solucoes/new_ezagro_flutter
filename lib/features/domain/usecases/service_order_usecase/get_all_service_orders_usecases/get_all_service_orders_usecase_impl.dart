import 'package:dartz/dartz.dart' as get_all_service_orders_usecase_impl;
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_usecase/get_all_service_orders_usecases/get_all_service_orders_usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../entities/service_order_entities/service_order_entity.dart';
import '../../../repositories/service_order_repositories/service_order_repository.dart';

class GetAllServiceOrdersUsecaseImpl implements GetAllServiceOrdersUsecase {
  final ServiceOrderRepository repository;

  GetAllServiceOrdersUsecaseImpl(this.repository);

  @override
  Future<get_all_service_orders_usecase_impl.Either<ApplicationError, ResponseEntity<List<ServiceOrderEntity>>>>
      call(NoParams noParams) async {
    return await repository.getAllServiceOrders(noParams);
  }
}
