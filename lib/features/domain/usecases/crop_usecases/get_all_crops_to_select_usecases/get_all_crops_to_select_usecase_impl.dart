import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/get_all_crops_to_select_usecases/get_all_crops_to_select_usecase.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/crop_repositories/crop_repository.dart';

class GetAllCropsToSelectUsecaseImpl implements GetAllCropsToSelectUsecase {
  final CropRepository repository;

  GetAllCropsToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(NoParams params) async {
    return await repository.getAllCropsToSelect(params);
  }
}
