import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/agricultural_input_datasources/agricultural_input_datasource.dart';

import 'package:new_ezagro_flutter/features/domain/entities/agricultural_input_entities/agricultural_input_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../core/errors/generic_error.dart';
import '../../../domain/params/arg_params/arg_params.dart';
import '../../../domain/repositories/agricultural_input_repositories/agricultural_input_repository.dart';

class AgriculturalInputRepositoryImpl implements AgriculturalInputRepository{
  final AgriculturalInputDatasource datasource;

  AgriculturalInputRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, AgriculturalInputEntity>> getAgriculturalInputById(ArgParams argParams) async {
    try {
      final result = await datasource.getAgriculturalInputById(argParams);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalInputRepositoryImpl.getAgriculturalInputById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<AgriculturalInputEntity>>> getAllAgriculturalInputs(NoParams noParams) async {
    try {
      final result = await datasource.getAllAgriculturalInputs(noParams);
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
  Future<Either<ApplicationError, List<SelectEntity>>> getAllAgriculturalInputsToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllAgriculturalInputsToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalInputRepositoryImpl.getAllAgriculturalInputsToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }
}