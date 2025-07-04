import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_sub_activity_entities/agricultural_sub_activity_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/select_entities/select_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class AgriculturalSubActivityRepository {
  Future<Either<ApplicationError, ResponseEntity<List<AgriculturalSubActivityEntity>>>>
      getAllAgriculturalSubActivities(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllAgriculturalSubActivitiesToSelect(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllAgriculturalSubActivitiesByActivityIdToSelect(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<AgriculturalSubActivityEntity>>>
      getAgriculturalSubActivityById(ArgParams argParams);
}
