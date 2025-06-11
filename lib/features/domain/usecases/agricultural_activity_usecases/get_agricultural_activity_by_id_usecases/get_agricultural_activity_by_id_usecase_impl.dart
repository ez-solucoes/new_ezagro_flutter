import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/agricultural_activity_usecases/get_agricultural_activity_by_id_usecases/get_agricultural_activity_by_id_usecase.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/agricultural_activity_repositories/agricultural_activity_repository.dart';

class GetAgriculturalActivityByIdUsecaseImpl
    implements GetAgriculturalActivityByIdUsecase {
  final AgriculturalActivityRepository repository;

  GetAgriculturalActivityByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<AgriculturalActivityEntity>>> call(
      ArgParams argParams) async {
    return await repository.getAgriculturalActivityById(argParams);
  }
}