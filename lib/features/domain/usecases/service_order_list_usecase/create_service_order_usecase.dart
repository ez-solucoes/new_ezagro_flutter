import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/field_service_order_entities/field_service_order_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/create_service_order_params/create_service_order_params.dart';

import '../../../../core/usecase/usecase.dart';

abstract class CreateServiceOrderUsecase
    implements Usecase<FieldServiceOrderEntity, MockParams> {
  @override
  Future<Either<ApplicationError, FieldServiceOrderEntity>> call(
      MockParams mockParams);
}
