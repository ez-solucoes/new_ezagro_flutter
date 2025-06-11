import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pest_entities/pest_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../../params/arg_params/arg_params.dart';

abstract class PestRepository {
  Future<Either<ApplicationError, ResponseEntity<List<PestEntity>>>>
  getAllPests(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
  getAllPestsToSelect(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<PestEntity>>>
  getPestById(ArgParams argParams);
}
