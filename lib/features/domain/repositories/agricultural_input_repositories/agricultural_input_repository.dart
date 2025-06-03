import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_input_entities/agricultural_input_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';


abstract class AgriculturalInputRepository {
  Future<Either<ApplicationError, List<AgriculturalInputEntity>>> getAllAgriculturalInputs(NoParams noParams);
  Future<Either<ApplicationError, AgriculturalInputEntity>> getAgriculturalInputById(ArgParams argParams);
  Future<Either<ApplicationError, List<SelectEntity>>> getAllAgriculturalInputsToSelect(NoParams noParams);
}