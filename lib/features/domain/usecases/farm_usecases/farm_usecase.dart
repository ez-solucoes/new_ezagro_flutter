import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

abstract class FarmUsecase implements Usecase<PaginationEntity<FarmEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<FarmEntity>>> call(NoParams params);
}