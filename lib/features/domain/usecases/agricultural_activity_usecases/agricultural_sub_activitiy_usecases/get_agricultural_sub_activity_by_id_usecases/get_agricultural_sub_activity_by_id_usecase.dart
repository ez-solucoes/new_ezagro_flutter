import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../entities/agricultural_entities/agricultural_sub_activity_entities/agricultural_sub_activity_entity.dart';
import '../../../../entities/response_entities/response_entity.dart';
import '../../../../params/arg_params/arg_params.dart';

abstract class GetAgriculturalSubActivityByIdUsecase
    implements Usecase<ResponseEntity<AgriculturalSubActivityEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<AgriculturalSubActivityEntity>>> call(ArgParams params);
}