import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../entities/select_entities/select_entity.dart';

abstract class GetAllContractsToSelectUsecase implements Usecase<ResponseEntity<List<SelectEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(NoParams noParams);
}