import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/crop_entities/crop_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/get_crop_by_id_usecases/get_crop_by_id_usecase.dart';

import '../../../params/arg_params/arg_params.dart';
import '../../../repositories/crop_repositories/crop_repository.dart';

class GetCropByIdUsecaseImpl implements GetCropByIdUsecase {
  final CropRepository repository;

  GetCropByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, CropEntity>> call(ArgParams argParams) async {
    return await repository.getCropById(argParams);
  }
}