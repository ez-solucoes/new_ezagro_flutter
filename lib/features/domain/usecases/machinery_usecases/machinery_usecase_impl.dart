import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

import '../../../../core/errors/application_error.dart';
import '../../repositories/machinery_repositories/machinery_repository.dart';
import 'machinery_usecase.dart';

class MachineryUsecaseImpl implements MachineryUsecase {
  final MachineryRepository repository;

  MachineryUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, PaginationEntity<MachineryImplementEntity>>>
      call(NoParams noParams) async {
    return await repository.getMachinery(noParams);
  }
}
