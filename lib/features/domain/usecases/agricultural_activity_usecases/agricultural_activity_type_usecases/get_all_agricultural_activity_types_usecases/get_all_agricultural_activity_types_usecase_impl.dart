import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../repositories/agricultural_activity_repositories/agricultural_activity_type_repositories/agricultural_activity_type_respository.dart';
import 'get_all_agricultural_activity_types_usecase.dart';

class GetAllAgriculturalActivityTypesUsecaseImpl
    implements GetAllAgriculturalActivityTypesUsecase {
  final AgriculturalActivityTypeRepository repository;

  GetAllAgriculturalActivityTypesUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<TypeEntity>>> call(NoParams noParams) async {
    return await repository.getAllAgriculturalActivityTypes(noParams);
  }
}
