import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../../entities/select_entities/select_entity.dart';
import '../../params/arg_params/arg_params.dart';

abstract class AgriculturalActivityRepository {
  Future<Either<ApplicationError, List<AgriculturalActivityEntity>>>
      getAllAgriculturalActivities(NoParams noParams);

  Future<Either<ApplicationError, List<SelectEntity>>>
      getAllAgriculturalActivitiesToSelect(NoParams noParams);

  Future<Either<ApplicationError, AgriculturalActivityEntity>>
      getAgriculturalActivityById(ArgParams argParams);

  Future<Either<ApplicationError, List<AgriculturalActivityEntity>>>
      getAllAgriculturalActivityByTypeId(ArgParams argParams);

  Future<Either<ApplicationError, List<SelectEntity>>>
  getAllAgriculturalActivitiesByTypeToSelect(ArgParams argParams);
}
