import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../entities/crop_entities/crop_variety_entity.dart';
import '../../../../params/arg_params/arg_params.dart';

abstract class GetCropVarietyByIdUsecase implements Usecase<CropVarietyEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, CropVarietyEntity>> call(ArgParams argParams);
}