import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import '../../../../core/usecase/usecase.dart';
import '../../params/arg_params/arg_params.dart';

abstract class EmployeeRepository {
  Future<Either<ApplicationError, ResponseEntity<List<EmployeeEntity>>>> getAllEmployees(
      NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllEmployeesToSelect(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<EmployeeEntity>>> getEmployeeById(
      ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllEmployeesByFarmIdToSelect(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<EmployeeEntity>>>>
      getAllEmployeesByFarmId(ArgParams argParams);
}
