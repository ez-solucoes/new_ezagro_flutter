import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../entities/agricultural_entities/agricultural_sub_activity_entities/agricultural_sub_activity_entity.dart';
import '../../../../entities/response_entities/response_entity.dart';
import '../../../../params/arg_params/arg_params.dart';
import '../../../../repositories/agricultural_activity_repositories/agricultural_sub_activity_repositories/agricultural_sub_activity_repository.dart';
import 'get_agricultural_sub_activity_by_id_usecase.dart';

class GetAgriculturalSubActivityByIdUsecaseImpl
    implements GetAgriculturalSubActivityByIdUsecase {
  final AgriculturalSubActivityRepository repository;

  GetAgriculturalSubActivityByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<AgriculturalSubActivityEntity>>> call(
      ArgParams argParams) async {
    return await repository.getAgriculturalSubActivityById(argParams);
  }
}