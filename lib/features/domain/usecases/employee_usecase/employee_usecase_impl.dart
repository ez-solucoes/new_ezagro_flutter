import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import '../../../../core/errors/application_error.dart';
import '../../repositories/employee_repositories/employee_repository.dart';
import 'employee_usecase.dart';

class EmployeeUsecaseImpl implements EmployeeUsecase {

  final EmployeeRepository repository;

  EmployeeUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, PaginationEntity<EmployeeEntity>>> call(NoParams noParams) async {
    return await repository.getEmployees(noParams);
  }
}