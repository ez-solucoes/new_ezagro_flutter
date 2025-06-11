import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../entities/response_entities/response_entity.dart';
import '../../../../entities/select_entities/select_entity.dart';
import '../../../../repositories/crop_repositories/crop_variety_repositories/crop_variety_repository.dart';
import 'get_all_crop_varieties_to_select_usecase.dart';

class GetAllCropVarietiesToSelectUsecaseImpl
    implements GetAllCropVarietiesToSelectUsecase {
  final CropVarietyRepository repository;

  GetAllCropVarietiesToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(NoParams params) async {
    return await repository.getAllCropVarietiesToSelect(params);
  }
}
