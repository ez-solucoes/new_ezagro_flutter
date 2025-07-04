import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_entities/service_order_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/response_entities/response_entity.dart';

abstract class GetAllServiceOrderByStatusIdUsecase implements Usecase<ResponseEntity<List<ServiceOrderEntity>>, ArgParams> {

  @override
  Future<Either<ApplicationError, ResponseEntity<List<ServiceOrderEntity>>>> call(ArgParams mockParams);
}