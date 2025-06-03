import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import 'package:new_ezagro_flutter/features/domain/entities/agricultural_input_entities/agricultural_input_entity.dart';

import '../../../repositories/agricultural_input_repositories/agricultural_input_repository.dart';
import 'get_all_agricultural_inputs_usecase.dart';

class GetAllAgriculturalInputsUsecaseImpl implements GetAllAgriculturalInputsUsecase {
  final AgriculturalInputRepository repository;

  GetAllAgriculturalInputsUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<AgriculturalInputEntity>>> call(
      NoParams noParams) async {
    return await repository.getAllAgriculturalInputs(noParams);
  }
}
