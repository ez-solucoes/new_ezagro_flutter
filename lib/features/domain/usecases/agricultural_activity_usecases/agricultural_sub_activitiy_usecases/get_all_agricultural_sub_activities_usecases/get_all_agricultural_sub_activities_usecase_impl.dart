import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../entities/agricultural_entities/agricultural_sub_activity_entities/agricultural_sub_activity_entity.dart';
import '../../../../repositories/agricultural_activity_repositories/agricultural_sub_activity_repositories/agricultural_sub_activity_repository.dart';
import 'get_all_agricultural_sub_activities_usecase.dart';

class GetAllAgriculturalSubActivitiesUsecaseImpl implements GetAllAgriculturalSubActivitiesUsecase {
  final AgriculturalSubActivityRepository repository;

  GetAllAgriculturalSubActivitiesUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<AgriculturalSubActivityEntity>>>
  call(NoParams noParams) async {
    return await repository.getAllAgriculturalSubActivities(noParams);
  }
}