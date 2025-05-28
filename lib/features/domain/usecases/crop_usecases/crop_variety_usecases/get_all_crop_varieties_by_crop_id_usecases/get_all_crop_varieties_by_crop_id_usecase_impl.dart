

import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/crop_entities/crop_variety_entity.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../params/arg_params/arg_params.dart';
import '../../../../repositories/crop_repositories/crop_variety_repositories/crop_variety_repository.dart';
import 'get_all_crop_varieties_by_crop_id_usecase.dart';

class GetAllCropVarietiesByCropIdUsecaseImpl implements GetAllCropVarietiesByCropIdUsecase{
  final CropVarietyRepository repository;

  GetAllCropVarietiesByCropIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<CropVarietyEntity>>> call(ArgParams argParams) async {
    return await repository.getAllCropVarietiesByCropId(argParams);
  }
}