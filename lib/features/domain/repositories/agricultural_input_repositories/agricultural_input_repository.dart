import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_input_entities/agricultural_input_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class AgriculturalInputRepository {
  Future<Either<ApplicationError, ResponseEntity<List<AgriculturalInputEntity>>>>
      getAllAgriculturalInputs(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<AgriculturalInputEntity>>>
      getAgriculturalInputById(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllAgriculturalInputsToSelect(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllAgriculturalInputsByClassIdToSelect(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<AgriculturalInputEntity>>>>
      getAllAgriculturalInputsByClassId(ArgParams argParams);
}
