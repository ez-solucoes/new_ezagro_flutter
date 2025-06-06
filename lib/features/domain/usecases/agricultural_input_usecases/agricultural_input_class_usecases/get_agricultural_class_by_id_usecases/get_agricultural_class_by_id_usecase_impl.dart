import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/class_entities/class_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../repositories/agricultural_input_repositories/agricultural_input_class_repositories/agricultural_input_class_repository.dart';
import 'get_agricultural_class_by_id_usecase.dart';

class GetAgriculturalInputClassByIdUsecaseImpl implements GetAgriculturalInputClassByIdUsecase {
  final AgriculturalInputClassRepository repository;

  GetAgriculturalInputClassByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ClassEntity>> call(ArgParams argParams) async {
    return await repository.getAgriculturalInputClassById(argParams);
  }
}
