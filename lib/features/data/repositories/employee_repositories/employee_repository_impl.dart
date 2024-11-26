import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/employee_models/employee_model.dart';

import '../../../domain/repositories/employee_repositories/employee_repository.dart';
import '../../datasources/remote_datasource/employee_datasources/employee_datasource.dart';
import '../../models/pagination_model/pagination_model.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeDatasource datasource;

  EmployeeRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<EmployeeModel>>> getEmployees(
      NoParams noParams) async {
    try {
      final result = await datasource.getEmployees(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$EmployeeRepositoryImpl.getEmployees',
          additionalInfo: stacktrace.toString()));
    }
  }
}
