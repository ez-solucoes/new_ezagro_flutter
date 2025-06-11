import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/employee_repositories/employee_repository.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/response_entities/response_entity.dart';
import 'get_all_employees_usecase.dart';

class GetAllEmployeesUsecaseImpl implements GetAllEmployeesUsecase {
  final EmployeeRepository repository;

  GetAllEmployeesUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<EmployeeEntity>>>> call(
      NoParams noParams) async {
    return await repository.getAllEmployees(noParams);
  }
}
