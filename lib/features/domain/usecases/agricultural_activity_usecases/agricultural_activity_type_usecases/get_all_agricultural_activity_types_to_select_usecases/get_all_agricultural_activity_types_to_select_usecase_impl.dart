import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/agricultural_activity_repositories/agricultural_activity_type_repositories/agricultural_activity_type_respository.dart';

import 'get_all_agricultural_activity_types_to_select_usecase.dart';

class GetAllAgriculturalActivityTypesToSelectUsecaseImpl
    implements GetAllAgriculturalActivityTypesToSelectUsecase {
  final AgriculturalActivityTypeRepository repository;

  GetAllAgriculturalActivityTypesToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(NoParams noParams) async {
    return await repository.getAllAgriculturalActivityTypesToSelect(noParams);
  }
}
