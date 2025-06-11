import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/generic_error.dart';
import '../../../../domain/repositories/agricultural_activity_repositories/agricultural_activity_type_repositories/agricultural_activity_type_respository.dart';
import '../../../datasources/remote_datasource/agricultural_activity_datasources/agricultural_activity_type_datasources/agricultural_activity_type_datasource.dart';
import '../../../models/response_models/response_model.dart';
import '../../../models/type_models/type_model.dart';

class AgriculturalActivityTypeRepositoryImpl
    implements AgriculturalActivityTypeRepository {
  final AgriculturalActivityTypeDatasource datasource;

  AgriculturalActivityTypeRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<TypeModel>>> getAgriculturalActivityTypeById(
      ArgParams argParams) async {
    try {
      final result = await datasource.getAgriculturalActivityTypeById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint:
              '$AgriculturalActivityTypeRepositoryImpl.getAgriculturalActivityTypeById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<TypeModel>>>> getAllAgriculturalActivityTypes(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllAgriculturalActivityTypes(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint:
              '$AgriculturalActivityTypeRepositoryImpl.getAllAgriculturalActivityTypes',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>>
      getAllAgriculturalActivityTypesToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllAgriculturalActivityTypesToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint:
              '$AgriculturalActivityTypeRepositoryImpl.getAllAgriculturalActivityTypesToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }
}
