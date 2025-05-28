import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../repositories/agricultural_activity_repositories/agricultural_sub_activity_repositories/agricultural_sub_activity_repository.dart';
import 'get_all_agricultural_sub_activities_by_activity_id_to_select_usecase.dart';

class GetAllAgriculturalSubActivitiesByActivityIdToSelectUsecaseImpl implements GetAllAgriculturalSubActivitiesByActivityIdToSelectUsecase{
  final AgriculturalSubActivityRepository repository;

  GetAllAgriculturalSubActivitiesByActivityIdToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(ArgParams argParams) async {
    return await repository.getAllAgriculturalSubActivitiesByActivityIdToSelect(argParams);
  }
}