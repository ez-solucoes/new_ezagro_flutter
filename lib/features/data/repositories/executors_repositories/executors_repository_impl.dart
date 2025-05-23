import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/employee_models/employee_model.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/executors_repositories/executors_repository.dart';

import '../../datasources/remote_datasource/executors_datasources/executors_datasource.dart';
import '../../models/pagination_model/pagination_model.dart';

class ExecutorsRepositoryImpl implements ExecutorsRepository {
  final ExecutorsDatasource datasource;

  ExecutorsRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<EmployeeModel>>> getExecutors(
      NoParams noParams) async {
    try {
      final result = await datasource.getExecutors(noParams);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ExecutorsRepositoryImpl.getExecutors',
          additionalInfo: stacktrace.toString()));
    }
  }
}
