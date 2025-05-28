import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/agricultural_activity_usecases/get_all_agricultural_activity_by_type_id_usecases/get_all_agricultural_activity_by_type_id_usecase.dart';

import '../../../repositories/agricultural_activity_repositories/agricultural_activity_repository.dart';


class GetAllAgriculturalActivityByTypeIdUsecaseImpl
    implements GetAllAgriculturalActivityByTypeIdUsecase {
  final AgriculturalActivityRepository repository;

  GetAllAgriculturalActivityByTypeIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<AgriculturalActivityEntity>>> call(
      ArgParams argParams) async {
    return await repository.getAllAgriculturalActivityByTypeId(argParams);
  }
}
