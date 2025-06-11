

import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/agricultural_activity_repositories/agricultural_activity_repository.dart';
import 'get_all_agricultural_activities_usecase.dart';

class GetAllAgriculturalActivitiesUsecaseImpl implements GetAllAgriculturalActivitiesUsecase {
  final AgriculturalActivityRepository repository;

  GetAllAgriculturalActivitiesUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<AgriculturalActivityEntity>>>>
      call(NoParams noParams) async {
    return await repository.getAllAgriculturalActivities(noParams);
  }
}
