import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../entities/crop_entities/crop_variety_entity.dart';
import '../../../../entities/response_entities/response_entity.dart';
import '../../../../params/arg_params/arg_params.dart';
import '../../../../repositories/crop_repositories/crop_variety_repositories/crop_variety_repository.dart';
import 'get_crop_variety_by_id_usecase.dart';

class GetCropVarietyByIdUsecaseImpl implements GetCropVarietyByIdUsecase {
  final CropVarietyRepository repository;

  GetCropVarietyByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<CropVarietyEntity>>> call(ArgParams argParams) async {
    return await repository.getCropVarietyById(argParams);
  }
}