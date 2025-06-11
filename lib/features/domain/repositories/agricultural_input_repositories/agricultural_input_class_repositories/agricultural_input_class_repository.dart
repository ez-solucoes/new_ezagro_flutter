import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/class_entities/class_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../params/arg_params/arg_params.dart';

abstract class AgriculturalInputClassRepository {
  Future<Either<ApplicationError, ResponseEntity<List<ClassEntity>>>>
      getAllAgriculturalInputClasses(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<ClassEntity>>>
      getAgriculturalInputClassById(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllAgriculturalInputClassesToSelect(NoParams noParams);
}
