import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../entities/crop_entities/crop_variety_entity.dart';
import '../../../../entities/response_entities/response_entity.dart';
import '../../../../params/arg_params/arg_params.dart';

abstract class GetCropVarietyByIdUsecase implements Usecase<ResponseEntity<CropVarietyEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<CropVarietyEntity>>> call(ArgParams argParams);
}