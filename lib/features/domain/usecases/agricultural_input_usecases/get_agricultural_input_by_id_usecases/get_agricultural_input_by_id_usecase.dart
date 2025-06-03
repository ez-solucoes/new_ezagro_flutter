import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_input_entities/agricultural_input_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/application_error.dart';

abstract class GetAgriculturalInputByIdUsecase implements Usecase<AgriculturalInputEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, AgriculturalInputEntity>> call(ArgParams argParams);

}