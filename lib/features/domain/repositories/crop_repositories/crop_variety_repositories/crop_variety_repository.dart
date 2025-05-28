import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/crop_entities/crop_variety_entity.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/select_entities/select_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class CropVarietyRepository {
  Future<Either<ApplicationError, List<CropVarietyEntity>>> getAllCropVarieties(
      NoParams noParams);
  Future<Either<ApplicationError, List<SelectEntity>>> getAllCropVarietiesToSelect(
      NoParams noParams);
  Future<Either<ApplicationError, CropVarietyEntity>> getCropVarietyById(ArgParams argParams);
  Future<Either<ApplicationError, List<CropVarietyEntity>>> getAllCropVarietiesByCropId(
      ArgParams argParams);
  Future<Either<ApplicationError, List<SelectEntity>>> getAllCropVarietiesByCropIdToSelect(
      ArgParams argParams);
}
