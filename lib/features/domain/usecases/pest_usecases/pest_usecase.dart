import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pest_entities/pest_entity.dart';

abstract class PestUsecase implements Usecase<PaginationEntity<PestEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<PestEntity>>>
  call(NoParams params);
}
