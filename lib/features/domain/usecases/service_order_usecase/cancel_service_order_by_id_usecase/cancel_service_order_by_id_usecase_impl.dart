import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_usecase/cancel_service_order_by_id_usecase/cancel_service_order_by_id_usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/service_order_entities/service_order_entity.dart';
import '../../../params/arg_params/arg_params.dart';
import '../../../repositories/service_order_repositories/service_order_repository.dart';

class CancelServiceOrderByIdUsecaseImpl implements CancelServiceOrderByIdUsecase {
  final ServiceOrderRepository repository;

  CancelServiceOrderByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ServiceOrderEntity>> call(ArgParams argParams) async {
    return await repository.cancelServiceOrderById(argParams);
  }
}