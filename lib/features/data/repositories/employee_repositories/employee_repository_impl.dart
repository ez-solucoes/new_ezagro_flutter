import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/Employee_datasources/Employee_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/mock_model/mock_model.dart';
import '../../../domain/repositories/employee_repositories/employee_repository.dart';
import '../../models/paginatino_model/pagination_model.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {

  final EmployeeDatasource datasource;

  EmployeeRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<MockModel>>> getEmployees(NoParams noParams) async {
    try{
      final result = await datasource.getEmployees(noParams);
      return Right(result);
    } on ApplicationError catch(e) {
      return Left(e);
    } catch(e, stacktrace) {
      return Left(
          GenericError(
              fingerprint: '$EmployeeRepositoryImpl.getEmployees',
              additionalInfo: stacktrace.toString()
          )
      );
    }
  }

}