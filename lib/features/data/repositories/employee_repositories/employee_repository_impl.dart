import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/employee_models/employee_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import '../../../domain/params/arg_params/arg_params.dart';
import '../../../domain/repositories/employee_repositories/employee_repository.dart';
import '../../datasources/remote_datasource/employee_datasources/employee_datasource.dart';
import '../../models/select_models/select_model.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeDatasource datasource;

  EmployeeRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<EmployeeModel>>>> getAllEmployees(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllEmployees(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$EmployeeRepositoryImpl.getEmployees',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<EmployeeModel>>> getEmployeeById(
      ArgParams argParams) async {
    try {
      final result = await datasource.getEmployeeById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$EmployeeRepositoryImpl.getEmployeeById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>>
      getAllEmployeesByFarmIdToSelect(ArgParams argParams) async {
    try {
      final result = await datasource.getAllEmployeesByFarmIdToSelect(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$EmployeeRepositoryImpl.getEmployeesByFarmIdToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseEntity<List<EmployeeEntity>>>>
      getAllEmployeesByFarmId(ArgParams argParams) async {
    try {
      final result = await datasource.getAllEmployeesByFarmId(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$EmployeeRepositoryImpl.getAllEmployeesByFarmId',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllEmployeesToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllEmployeesToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$EmployeeRepositoryImpl.getAllEmployeesToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }
}
