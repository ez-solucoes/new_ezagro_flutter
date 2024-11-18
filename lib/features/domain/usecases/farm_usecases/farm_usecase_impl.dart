import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/farm_repositories/farm_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/farm_usecases/farm_usecase.dart';

import '../../../../core/errors/application_error.dart';

class FarmUsecaseImpl implements FarmUsecase {
  final FarmRepository repository;

  FarmUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, PaginationEntity<FarmEntity>>> call(
      NoParams noParams) async {
    return await repository.getSimplifiedFarms(noParams);
  }
}
