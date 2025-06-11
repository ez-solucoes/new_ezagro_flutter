import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/farm_repositories/farm_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/farm_usecases/get_all_farms_to_select_usecases/get_all_farms_to_select_usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../entities/select_entities/select_entity.dart';

class GetAllFarmsToSelectUsecaseImpl implements GetAllFarmsToSelectUsecase {
  final FarmRepository repository;

  GetAllFarmsToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(
      NoParams noParams) async {
    return await repository.getAllFarmsToSelect(noParams);
  }
}
