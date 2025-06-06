import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/agricultural_input_entities/agricultural_input_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../repositories/agricultural_input_repositories/agricultural_input_repository.dart';
import 'get_all_agricultural_inputs_by_class_id_usecase.dart';

class GetAllAgriculturalInputsByClassIdUsecaseImpl
    implements GetAllAgriculturalInputsByClassIdUsecase {
  final AgriculturalInputRepository repository;

  GetAllAgriculturalInputsByClassIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<AgriculturalInputEntity>>> call(
      ArgParams argParams) async {
    return await repository.getAllAgriculturalInputsByClassId(argParams);
  }
}
