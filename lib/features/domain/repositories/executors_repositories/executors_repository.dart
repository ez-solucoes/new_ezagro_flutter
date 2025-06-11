import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../../params/arg_params/arg_params.dart';

abstract class ExecutorsRepository {
  Future<Either<ApplicationError, ResponseEntity<List<EmployeeEntity>>>>
  getAllExecutors(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
  getAllExecutorsToSelect(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<EmployeeEntity>>>
  getExecutorById(ArgParams argParams);


}
