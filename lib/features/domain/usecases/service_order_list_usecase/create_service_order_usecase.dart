import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/mockEntity/mock_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/create_service_order_params/create_service_order_params.dart';
import '../../../../core/usecase/usecase.dart';

abstract class CreateServiceOrderUsecase implements Usecase<MockEntity, MockParams> {

  @override
  Future<Either<ApplicationError, MockEntity>> call(MockParams mockParams);
}