import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/crop_entities/crop_entity.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';

abstract class GetAllCropsUsecase implements Usecase<List<CropEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<CropEntity>>> call(NoParams params);
}
