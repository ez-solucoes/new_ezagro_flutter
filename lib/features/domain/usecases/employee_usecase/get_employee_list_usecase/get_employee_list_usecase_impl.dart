import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/employee_repositories/employee_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/employee_usecase/get_employee_list_usecase/get_employee_list_usecase.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';

class GetEmployeeListUsecaseImpl implements GetEmployeeListUsecase {
  final EmployeeRepository repository;

  GetEmployeeListUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<EmployeeEntity>>> call(
      NoParams noParams) async {
    return await repository.getEmployees(noParams);
  }
}
