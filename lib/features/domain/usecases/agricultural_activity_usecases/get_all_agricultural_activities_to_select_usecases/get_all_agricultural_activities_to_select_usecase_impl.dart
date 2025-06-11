import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../entities/select_entities/select_entity.dart';
import '../../../repositories/agricultural_activity_repositories/agricultural_activity_repository.dart';
import 'get_all_agricultural_activities_to_select_usecase.dart';

class GetAllAgriculturalActivitiesToSelectUsecaseImpl
    implements GetAllAgriculturalActivitiesToSelectUsecase {
  final AgriculturalActivityRepository repository;

  GetAllAgriculturalActivitiesToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(NoParams noParams) async {
    return await repository.getAllAgriculturalActivitiesToSelect(noParams);
  }
}
