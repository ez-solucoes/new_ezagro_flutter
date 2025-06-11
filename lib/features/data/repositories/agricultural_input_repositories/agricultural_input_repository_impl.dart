import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/agricultural_input_datasources/agricultural_input_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/agricultural_input_models/agricultural_input_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import '../../../../core/errors/generic_error.dart';
import '../../../domain/params/arg_params/arg_params.dart';
import '../../../domain/repositories/agricultural_input_repositories/agricultural_input_repository.dart';

class AgriculturalInputRepositoryImpl implements AgriculturalInputRepository {
  final AgriculturalInputDatasource datasource;

  AgriculturalInputRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<AgriculturalInputModel>>>
      getAgriculturalInputById(ArgParams argParams) async {
    try {
      final result = await datasource.getAgriculturalInputById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalInputRepositoryImpl.getAgriculturalInputById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<AgriculturalInputModel>>>>
      getAllAgriculturalInputs(ArgParams argParams) async {
    try {
      final result = await datasource.getAllAgriculturalInputs(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalInputRepositoryImpl.getAllAgriculturalInputs',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>>
      getAllAgriculturalInputsToSelect(ArgParams argParams) async {
    try {
      final result = await datasource.getAllAgriculturalInputsToSelect(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint:
              '$AgriculturalInputRepositoryImpl.getAllAgriculturalInputsToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<AgriculturalInputModel>>>>
      getAllAgriculturalInputsByClassId(ArgParams argParams) async {
    try {
      final result = await datasource.getAllAgriculturalInputsByClassId(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint:
              '$AgriculturalInputRepositoryImpl.getAllAgriculturalInputsByClassId',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>>
      getAllAgriculturalInputsByClassIdToSelect(ArgParams argParams) async {
    try {
      final result =
          await datasource.getAllAgriculturalInputsByClassIdToSelect(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint:
              '$AgriculturalInputRepositoryImpl.getAllAgriculturalInputsByClassIdToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }
}
