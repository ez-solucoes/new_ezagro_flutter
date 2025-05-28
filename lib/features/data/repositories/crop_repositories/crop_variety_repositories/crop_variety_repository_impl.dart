import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/crop_models/crop_variety_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/crop_repositories/crop_variety_repositories/crop_variety_repository.dart';

import '../../../../../core/errors/generic_error.dart';
import '../../../datasources/remote_datasource/crop_datasources/crop_variety_datasources/crop_variety_datasource.dart';

class CropVarietyRepositoryImpl implements CropVarietyRepository {
  final CropVarietyDatasource datasource;

  CropVarietyRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, List<CropVarietyModel>>> getAllCropVarieties(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllCropVarieties(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CropVarietyRepositoryImpl.getAllCropVarieties',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<SelectModel>>> getAllCropVarietiesToSelect(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllCropVarietiesToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CropVarietyRepositoryImpl.getAllCropVarietiesToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, CropVarietyModel>> getCropVarietyById(
      ArgParams argParams) async {
    try {
      final result = await datasource.getCropVarietyById(argParams);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CropVarietyRepositoryImpl.getCropVarietyById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<CropVarietyModel>>> getAllCropVarietiesByCropId(ArgParams argParams) async {
    try {
      final result = await datasource.getAllCropVarietiesByCropId(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CropVarietyRepositoryImpl.getAllCropVarietiesByCropId',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<SelectModel>>> getAllCropVarietiesByCropIdToSelect(ArgParams argParams) async {
    try {
      final result = await datasource.getAllCropVarietiesByCropIdToSelect(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CropVarietyRepositoryImpl.getAllCropVarietiesByCropIdToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }
}
