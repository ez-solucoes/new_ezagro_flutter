import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/crop_entities/crop_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../../entities/select_entities/select_entity.dart';
import '../../params/arg_params/arg_params.dart';

abstract class CropRepository {
  Future<Either<ApplicationError, List<CropEntity>>> getAllCrops(NoParams noParams);
  Future<Either<ApplicationError, List<SelectEntity>>> getAllCropsToSelect(
      NoParams noParams);
  Future<Either<ApplicationError, CropEntity>> getCropById(ArgParams argParams);
}
