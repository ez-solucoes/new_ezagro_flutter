import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/crop_entities/crop_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import '../../../../core/usecase/usecase.dart';

abstract class CropRepository {
  Future<Either<ApplicationError, PaginationEntity<CropEntity>>> getSimplifiedCrops(NoParams noParams);
}