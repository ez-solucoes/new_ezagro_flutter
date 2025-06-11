import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pest_entities/pest_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/pest_repositories/pest_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/pest_usecases/get_all_pests_usecases/get_all_pests_usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/response_entities/response_entity.dart';

class GetAllPestsUsecaseImpl implements GetAllPestsUsecase {
  final PestRepository repository;

  GetAllPestsUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<PestEntity>>>>
  call(NoParams noParams) async {
    return await repository.getAllPests(noParams);
  }
}
