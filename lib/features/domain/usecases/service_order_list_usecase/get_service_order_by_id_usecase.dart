import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import '../../../../core/errors/application_error.dart';
import '../../../../core/usecase/usecase.dart';
import '../../entities/field_service_order_entities/field_service_order_entity.dart';

abstract class GetServiceOrderByIdUsecase implements Usecase<FieldServiceOrderEntity, ArgParams> {

  @override
  Future<Either<ApplicationError, FieldServiceOrderEntity>> call(ArgParams mockParams);
}