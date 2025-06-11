import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pest_entities/pest_entity.dart';

import '../../../entities/response_entities/response_entity.dart';

abstract class GetAllPestsUsecase implements Usecase<ResponseEntity<List<PestEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<PestEntity>>>>
  call(NoParams params);
}
