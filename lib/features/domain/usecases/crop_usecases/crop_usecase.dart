import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/crop_entities/crop_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

abstract class CropUsecase
    implements Usecase<PaginationEntity<CropEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<CropEntity>>> call(
      NoParams params);
}
