import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/machinery_implement_repositories/machinery_implement_repository.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../entities/select_entities/select_entity.dart';
import 'get_all_machinery_implements_to_select_usecase.dart';

class GetAllMachineryImplementsToSelectUsecaseImpl implements GetAllMachineryImplementsToSelectUsecase {
  final MachineryImplementRepository repository;

  GetAllMachineryImplementsToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      call(NoParams noParams) async {
    return await repository.getAllMachineryImplementsToSelect(noParams);
  }
}
