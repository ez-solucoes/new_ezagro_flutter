import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/agricultural_input_entities/agricultural_input_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/agricultural_input_repositories/agricultural_input_repository.dart';
import 'get_agricultural_input_by_id_usecase.dart';

class GetAgriculturalInputByIdUsecaseImpl implements GetAgriculturalInputByIdUsecase {
  final AgriculturalInputRepository repository;

  GetAgriculturalInputByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<AgriculturalInputEntity>>> call(
      ArgParams argParams) async {
    return await repository.getAgriculturalInputById(argParams);
  }
}
