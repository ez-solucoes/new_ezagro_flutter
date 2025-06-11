import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/service_order_repositories/service_order_repository.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../entities/service_order_entities/service_order_entity.dart';
import '../../../params/arg_params/arg_params.dart';
import 'get_service_order_by_id_usecase.dart';


class GetServiceOrderByIdUsecaseImpl implements GetServiceOrderByIdUsecase {

  ServiceOrderRepository repository;

  GetServiceOrderByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<ServiceOrderEntity>>> call(ArgParams params) async {
    return await repository.getServiceOrderById(params);
  }

}