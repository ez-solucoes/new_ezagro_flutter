import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/application_error.dart';

abstract class GetAgriculturalActivityByTypeIdUsecase
    implements Usecase<AgriculturalActivityEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, AgriculturalActivityEntity>> call(ArgParams params);
}
