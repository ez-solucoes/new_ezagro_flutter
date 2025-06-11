import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_entities/service_order_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/service_order_repositories/service_order_repository.dart';
import 'get_all_service_order_by_status_id_usecase.dart';

class GetAllServiceOrderByStatusIdUsecaseImpl implements GetAllServiceOrderByStatusIdUsecase {
  final ServiceOrderRepository repository;

  GetAllServiceOrderByStatusIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<ServiceOrderEntity>>>> call(ArgParams params) async {
    return await repository.getAllServiceOrdersByStatusId(params);
  }

}