import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../params/arg_params/arg_params.dart';

abstract class GetAgriculturalActivityTypeByIdUsecase
    implements Usecase<TypeEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, TypeEntity>> call(ArgParams params);
}