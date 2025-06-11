import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/agricultural_activity_repositories/agricultural_activity_type_repositories/agricultural_activity_type_respository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/agricultural_activity_usecases/agricultural_activity_type_usecases/get_agricultural_activity_type_by_id_usecases/get_agricultural_activity_type_by_id_usecase.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../entities/response_entities/response_entity.dart';
import '../../../../params/arg_params/arg_params.dart';

class GetAgriculturalActivityTypeByIdUsecaseImpl
    implements GetAgriculturalActivityTypeByIdUsecase {
  final AgriculturalActivityTypeRepository repository;

  GetAgriculturalActivityTypeByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<TypeEntity>>> call(ArgParams argParams) async {
    return await repository.getAgriculturalActivityTypeById(argParams);
  }
}
