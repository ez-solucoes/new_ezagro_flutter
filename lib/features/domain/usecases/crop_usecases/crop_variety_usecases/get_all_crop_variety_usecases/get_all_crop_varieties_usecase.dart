import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/crop_entities/crop_variety_entity.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';

abstract class GetAllCropVarietiesUsecase
    implements Usecase<List<CropVarietyEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<CropVarietyEntity>>> call(NoParams params);
}
