import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../repositories/agricultural_activity_repositories/agricultural_activity_repository.dart';
import 'get_agricultural_activity_by_type_id_usecase.dart';

class GetAgriculturalActivityByTypeIdUsecaseImpl
    implements GetAgriculturalActivityByTypeIdUsecase {
  final AgriculturalActivityRepository repository;

  GetAgriculturalActivityByTypeIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, AgriculturalActivityEntity>> call(
      ArgParams argParams) async {
    return await repository.getAgriculturalActivityByTypeId(argParams);
  }
}
