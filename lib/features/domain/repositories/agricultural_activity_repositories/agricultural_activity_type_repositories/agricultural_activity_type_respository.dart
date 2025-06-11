import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../entities/select_entities/select_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class AgriculturalActivityTypeRepository {
  Future<Either<ApplicationError, ResponseEntity<TypeEntity>>> getAgriculturalActivityTypeById(ArgParams argParams);
  Future<Either<ApplicationError, ResponseEntity<List<TypeEntity>>>> getAllAgriculturalActivityTypes(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> getAllAgriculturalActivityTypesToSelect(NoParams noParams);
}