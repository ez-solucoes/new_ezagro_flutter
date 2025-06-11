import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../../entities/select_entities/select_entity.dart';
import '../../params/arg_params/arg_params.dart';

abstract class AgriculturalActivityRepository {
  Future<Either<ApplicationError, ResponseEntity<List<AgriculturalActivityEntity>>>>
      getAllAgriculturalActivities(NoParams noParams);

  Future<Either<ApplicationError,ResponseEntity<List<SelectEntity>>>>
      getAllAgriculturalActivitiesToSelect(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<AgriculturalActivityEntity>>>
      getAgriculturalActivityById(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<AgriculturalActivityEntity>>>>
      getAllAgriculturalActivityByTypeId(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
  getAllAgriculturalActivitiesByTypeToSelect(ArgParams argParams);
}
