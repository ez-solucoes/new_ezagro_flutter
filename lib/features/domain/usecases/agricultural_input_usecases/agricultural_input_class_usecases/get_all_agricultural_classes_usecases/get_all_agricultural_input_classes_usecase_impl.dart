import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import 'package:new_ezagro_flutter/features/domain/entities/class_entities/class_entity.dart';

import '../../../../entities/response_entities/response_entity.dart';
import '../../../../repositories/agricultural_input_repositories/agricultural_input_class_repositories/agricultural_input_class_repository.dart';
import 'get_all_agricultural_input_classes_usecase.dart';

class GetAllAgriculturalInputClassesUsecaseImpl implements GetAllAgriculturalInputClassesUsecase{
  final AgriculturalInputClassRepository repository;

  GetAllAgriculturalInputClassesUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<ClassEntity>>>> call(NoParams noParams) async {
    return await repository.getAllAgriculturalInputClasses(noParams);
  }
}