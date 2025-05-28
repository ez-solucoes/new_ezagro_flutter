import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/crop_entities/crop_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/application_error.dart';

abstract class GetCropByIdUsecase implements Usecase<CropEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, CropEntity>> call(ArgParams argParams);
}
