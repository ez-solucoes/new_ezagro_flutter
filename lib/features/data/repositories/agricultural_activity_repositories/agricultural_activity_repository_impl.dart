import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/agricultural_models/agricultural_activity_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../domain/repositories/agricultural_activity_repositories/agricultural_activity_repository.dart';
import '../../datasources/remote_datasource/agricultural_activity_datasources/agricultural_activity_datasource.dart';

class AgriculturalActivityRepositoryImpl implements AgriculturalActivityRepository {
  final AgriculturalActivityDatasource datasource;

  AgriculturalActivityRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<AgriculturalActivityModel>>>>
      getAllAgriculturalActivities(NoParams noParams) async {
    try {
      final result = await datasource.getAllAgriculturalActivities(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalActivityRepositoryImpl.getAllAgriculturalActivities',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<AgriculturalActivityModel>>> getAgriculturalActivityById(ArgParams argParams) async {
    try {
      final result = await datasource.getAgriculturalActivityById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalActivityRepositoryImpl.getAgriculturalActivityById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<AgriculturalActivityModel>>>> getAllAgriculturalActivityByTypeId(ArgParams argParams) async {
    try {
      final result = await datasource.getAllAgriculturalActivityByTypeId(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalActivityRepositoryImpl.getAllAgriculturalActivityByTypeId',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError,ResponseModel< List<SelectModel>>>> getAllAgriculturalActivitiesToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllAgriculturalActivitiesToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalActivityRepositoryImpl.getAllAgriculturalActivitiesToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>> getAllAgriculturalActivitiesByTypeToSelect(ArgParams argParams) async {
    try {
      final result = await datasource.getAllAgriculturalActivityByTypeIdToSelect(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalActivityRepositoryImpl.getAllAgriculturalActivityByTypeIdToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }
}
