import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/crop_entities/crop_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/crop_repositories/crop_repository.dart';

import '../../datasources/remote_datasource/crop_datasources/crop_datasource.dart';

class CropRepositoryImpl implements CropRepository {
  final CropDatasource datasource;

  CropRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<CropEntity>>>> getAllCrops(NoParams noParams) async {
    try {
      final result = await datasource.getAllCrops(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CropRepositoryImpl.getAllCrops',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectEntity>>>> getAllCropsToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllCropsToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CropRepositoryImpl.getAllCropsToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<CropEntity>>> getCropById(ArgParams argParams) async {
    try {
      final result = await datasource.getCropById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CropRepositoryImpl.getCropById',
          additionalInfo: stacktrace.toString()));
    }
  }


}
