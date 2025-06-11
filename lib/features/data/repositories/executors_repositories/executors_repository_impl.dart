import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/employee_models/employee_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/executors_repositories/executors_repository.dart';

import '../../../domain/params/arg_params/arg_params.dart';
import '../../datasources/remote_datasource/executors_datasources/executors_datasource.dart';

class ExecutorsRepositoryImpl implements ExecutorsRepository {
  final ExecutorsDatasource datasource;

  ExecutorsRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<EmployeeModel>>>> getAllExecutors(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllExecutors(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ExecutorsRepositoryImpl.getExecutors',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>> getAllExecutorsToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllExecutorsToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ExecutorsRepositoryImpl.getAllExecutorsToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<EmployeeModel>>> getExecutorById(ArgParams argParams) async {
    try {
      final result = await datasource.getExecutorById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ExecutorsRepositoryImpl.getExecutorById',
          additionalInfo: stacktrace.toString()));
    }
  }
}
