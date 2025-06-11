import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_usecase/approve_service_order_by_id_usecase/approve_service_order_by_id_usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../entities/service_order_entities/service_order_entity.dart';
import '../../../params/arg_params/arg_params.dart';
import '../../../repositories/service_order_repositories/service_order_repository.dart';

class ApproveServiceOrderByIdUsecaseImpl implements ApproveServiceOrderByIdUsecase {
  final ServiceOrderRepository repository;

  ApproveServiceOrderByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<ServiceOrderEntity>>> call(ArgParams argParams) async {
    return await repository.approveServiceOrderById(argParams);
  }

}