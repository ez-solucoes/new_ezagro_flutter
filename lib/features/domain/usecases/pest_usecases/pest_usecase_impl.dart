import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pest_entities/pest_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/pest_repositories/pest_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/pest_usecases/pest_usecase.dart';

import '../../../../core/errors/application_error.dart';

class PestUsecaseImpl implements PestUsecase {
  final PestRepository repository;

  PestUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, PaginationEntity<PestEntity>>>
  call(NoParams noParams) async {
    return await repository.getPests(noParams);
  }
}
