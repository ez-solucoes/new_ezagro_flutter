import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../entities/response_entities/response_entity.dart';
import '../../../../entities/select_entities/select_entity.dart';
import '../../../../repositories/agricultural_activity_repositories/agricultural_sub_activity_repositories/agricultural_sub_activity_repository.dart';
import 'get_all_agricultural_sub_activities_to_select_usecase.dart';

class GetAllAgriculturalSubActivitiesToSelectUsecaseImpl
    implements GetAllAgriculturalSubActivitiesToSelectUsecase {
  final AgriculturalSubActivityRepository repository;

  GetAllAgriculturalSubActivitiesToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(NoParams noParams) async {
    return await repository.getAllAgriculturalSubActivitiesToSelect(noParams);
  }
}