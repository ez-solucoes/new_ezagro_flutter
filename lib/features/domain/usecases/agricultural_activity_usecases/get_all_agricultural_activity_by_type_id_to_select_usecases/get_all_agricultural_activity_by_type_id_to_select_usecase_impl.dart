import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/agricultural_activity_usecases/get_all_agricultural_activity_by_type_id_to_select_usecases/get_all_agricultural_activity_by_type_id_to_select_usecase.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/agricultural_activity_repositories/agricultural_activity_repository.dart';

class GetAllAgriculturalActivitiesByTypeIdToSelectUsecaseImpl
    implements GetAllAgriculturalActivitiesByTypeIdToSelectUsecase {
  final AgriculturalActivityRepository repository;

  GetAllAgriculturalActivitiesByTypeIdToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(ArgParams argParams) async {
    return await repository.getAllAgriculturalActivitiesByTypeToSelect(argParams);
  }
}
