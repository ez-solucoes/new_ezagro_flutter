import 'package:dartz/dartz.dart';
import '../../../../core/errors/application_error.dart';
import '../../../../core/usecase/usecase.dart';
import '../../entities/employee_entities/employee_entity/employee_entity.dart';
import '../../repositories/employee_repositories/employee_repository.dart';
import 'employee_usecase.dart';

class EmployeeUsecaseImpl implements EmployeeUsecase {
  final EmployeeRepository repository;

  EmployeeUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<EmployeeEntity>>> call(
      NoParams noParams) async {
    return await repository.getEmployees(noParams);
  }
}
