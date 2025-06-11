import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/pest_entities/pest_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/pest_repositories/pest_repository.dart';

import 'get_pest_by_id_usecase.dart';

class GetPestByIdUsecaseImpl implements GetPestByIdUsecase {
  final PestRepository repository;

  const GetPestByIdUsecaseImpl(this.repository);
  @override
  Future<Either<ApplicationError, ResponseEntity<PestEntity>>> call(ArgParams argParams) async {
    return await repository.getPestById(argParams);
  }
}