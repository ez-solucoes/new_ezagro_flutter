import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_entities/service_order_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../repositories/service_order_repositories/service_order_repository.dart';
import 'get_service_order_by_status_id_usecase.dart';

class GetServiceOrderByStatusIdUsecaseImpl implements GetServiceOrderByStatusIdUsecase {
  final ServiceOrderRepository repository;

  GetServiceOrderByStatusIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<ServiceOrderEntity>>> call(ArgParams params) async {
    return await repository.getServiceOrderByStatusId(params);
  }

}