import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/employee_repositories/employee_repository.dart';

import '../../../entities/response_entities/response_entity.dart';
import 'get_all_employees_by_farm_id_to_select_usecase.dart';

class GetAllEmployeesByFarmIdToSelectUsecaseImpl implements GetAllEmployeesByFarmIdToSelectUsecase {
  final EmployeeRepository repository;

  GetAllEmployeesByFarmIdToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(ArgParams argParams) async {
    return await repository.getAllEmployeesByFarmIdToSelect(argParams);
  }
}
