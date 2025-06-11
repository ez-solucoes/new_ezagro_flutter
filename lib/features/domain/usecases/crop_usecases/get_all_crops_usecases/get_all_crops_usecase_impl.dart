import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/crop_entities/crop_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/get_all_crops_usecases/get_all_crops_usecase.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/crop_repositories/crop_repository.dart';

class GetAllCropsUsecaseImpl implements GetAllCropsUsecase {
  final CropRepository repository;

  GetAllCropsUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<CropEntity>>>> call(NoParams noParams) async {
    return await repository.getAllCrops(noParams);
  }

}