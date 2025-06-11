import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/response_entities/response_entity.dart';

abstract class GetAgriculturalActivityByIdUsecase
    implements Usecase<ResponseEntity<AgriculturalActivityEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<AgriculturalActivityEntity>>> call(ArgParams params);
}
