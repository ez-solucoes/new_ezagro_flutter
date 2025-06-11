import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/employee_repositories/employee_repository.dart';

import 'get_all_employees_by_farm_id_usecase.dart';

class GetAllEmployeesByFarmIdUsecaseImpl implements GetAllEmployeesByFarmIdUsecase {
  final EmployeeRepository repository;

  const GetAllEmployeesByFarmIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<EmployeeEntity>>>> call(
      ArgParams argParams) async {
    return await repository.getAllEmployeesByFarmId(argParams);
  }
}
