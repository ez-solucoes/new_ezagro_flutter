import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/agricultural_activity_datasources/agricultural_sub_activity_datasources/agricultural_sub_activity_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/agricultural_models/agricultural_sub_activity_models/agricultural_sub_activity_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/agricultural_activity_repositories/agricultural_sub_activity_repositories/agricultural_sub_activity_repository.dart';

import '../../../../../core/errors/generic_error.dart';

class AgriculturalSubActivityRepositoryImpl implements AgriculturalSubActivityRepository {

  final AgriculturalSubActivityDatasource datasource;

  AgriculturalSubActivityRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, AgriculturalSubActivityModel>> getAgriculturalSubActivityById(ArgParams argParams) async {
    try {
      final result = await datasource.getAgriculturalSubActivityById(argParams);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalSubActivityRepositoryImpl.getAgriculturalSubActivityById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<AgriculturalSubActivityModel>>> getAllAgriculturalSubActivities(NoParams noParams) async {
    try {
      final result = await datasource.getAllAgriculturalSubActivities(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalSubActivityRepositoryImpl.getAllAgriculturalSubActivities',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<SelectModel>>> getAllAgriculturalSubActivitiesToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllAgriculturalSubActivitiesToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalSubActivityRepositoryImpl.getAllAgriculturalSubActivitiesToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

}