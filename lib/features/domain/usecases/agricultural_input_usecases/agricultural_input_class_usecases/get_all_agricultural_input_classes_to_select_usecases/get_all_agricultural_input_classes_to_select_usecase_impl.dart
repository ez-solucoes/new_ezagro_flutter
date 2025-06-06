import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../repositories/agricultural_input_repositories/agricultural_input_class_repositories/agricultural_input_class_repository.dart';
import 'get_all_agricultural_input_classes_to_select_usecase.dart';

class GetAllAgriculturalInputClassesToSelectUsecaseImpl
    implements GetAllAgriculturalInputClassesToSelectUsecase {
  final AgriculturalInputClassRepository repository;

  GetAllAgriculturalInputClassesToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(NoParams noParams) async {
    return await repository.getAllAgriculturalInputClassesToSelect(noParams);
  }
}
