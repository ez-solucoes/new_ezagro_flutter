import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/agricultural_input_repositories/agricultural_input_repository.dart';

import 'get_all_agricultural_inputs_by_class_id_to_select_usecase.dart';

class GetAllAgriculturalInputsByClassIdToSelectUsecaseImpl implements GetAllAgriculturalInputsByClassIdToSelectUsecase{
  final AgriculturalInputRepository repository;

  GetAllAgriculturalInputsByClassIdToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(ArgParams argParams) async {
    return repository.getAllAgriculturalInputsByClassIdToSelect(argParams);
  }
}