import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../entities/response_entities/response_entity.dart';
import '../../../../repositories/crop_repositories/crop_variety_repositories/crop_variety_repository.dart';
import 'get_all_crop_varieties_by_crop_id_to_select_usecase.dart';

class GetAllCropVarietiesByCropIdToSelectUsecaseImpl implements GetAllCropVarietiesByCropIdToSelectUsecase {
  final CropVarietyRepository repository;

  GetAllCropVarietiesByCropIdToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(ArgParams argParams) async {
    return await repository.getAllCropVarietiesByCropIdToSelect(argParams);
  }
}