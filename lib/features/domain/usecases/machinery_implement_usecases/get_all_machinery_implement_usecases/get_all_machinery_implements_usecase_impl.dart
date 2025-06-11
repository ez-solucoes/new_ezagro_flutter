import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/machinery_implement_repositories/machinery_implement_repository.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/machinery_implement_entities/machinery_implement_entity.dart';
import '../../../entities/response_entities/response_entity.dart';
import 'get_all_machinery_implements_usecase.dart';

class GetAllMachineryImplementsUsecaseImpl implements GetAllMachineryImplementsUsecase {
  final MachineryImplementRepository repository;

  GetAllMachineryImplementsUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<MachineryImplementEntity>>>>
  call(NoParams noParams) async {
    return await repository.getAllMachineryImplements(noParams);
  }
}