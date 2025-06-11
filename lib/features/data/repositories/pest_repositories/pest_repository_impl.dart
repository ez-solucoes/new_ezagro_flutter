import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/pest_models/pest_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/pest_repositories/pest_repository.dart';

import '../../datasources/remote_datasource/pest_datasources/pest_datasource.dart';

class PestRepositoryImpl implements PestRepository {
  final PestDatasource datasource;

  PestRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<PestModel>>>> getAllPests(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllPests(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PestRepositoryImpl.getAllPests',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>> getAllPestsToSelect(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllPestsToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PestRepositoryImpl.getAllPestsToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<PestModel>>> getPestById(
      ArgParams argParams) async {
    try {
      final result = await datasource.getPestById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PestRepositoryImpl.getPestById',
          additionalInfo: stacktrace.toString()));
    }
  }
}
