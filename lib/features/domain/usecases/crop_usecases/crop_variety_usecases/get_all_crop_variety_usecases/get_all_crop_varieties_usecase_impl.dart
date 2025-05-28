import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/crop_repositories/crop_variety_repositories/crop_variety_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/crop_variety_usecases/get_all_crop_variety_usecases/get_all_crop_varieties_usecase.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../entities/crop_entities/crop_variety_entity.dart';

class GetAllCropVarietiesUsecaseImpl implements GetAllCropVarietiesUsecase {
  final CropVarietyRepository repository;

  GetAllCropVarietiesUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<CropVarietyEntity>>> call(
      NoParams noParams) async {
    return await repository.getAllCropVarieties(noParams);
  }
}
