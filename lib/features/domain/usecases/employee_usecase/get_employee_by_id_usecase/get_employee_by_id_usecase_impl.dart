
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/employee_entities/employee_entity/employee_entity.dart';
import '../../../params/arg_params/arg_params.dart';
import '../../../repositories/employee_repositories/employee_repository.dart';
import 'get_employee_by_id_usecase.dart';

class GetEmployeeByIdUsecaseImpl implements GetEmployeeByIdUsecase {

  final EmployeeRepository repository;

  GetEmployeeByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, EmployeeEntity>> call(
      ArgParams argParams) async {
    return await repository.getEmployeeById(argParams);
  }
}