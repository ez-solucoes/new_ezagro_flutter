import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import 'package:new_ezagro_flutter/features/domain/entities/class_entities/class_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/generic_error.dart';
import '../../../../domain/repositories/agricultural_input_repositories/agricultural_input_class_repositories/agricultural_input_class_repository.dart';
import '../../../datasources/remote_datasource/agricultural_input_datasources/agricultural_input_class_datasources/agricultural_input_class_datasource.dart';

class AgriculturalInputClassRepositoryImpl implements AgriculturalInputClassRepository{
  final AgriculturalInputClassDatasource datasource;

  AgriculturalInputClassRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ClassEntity>> getAgriculturalInputClassById(ArgParams argParams) async {
    try {
      final result = await datasource.getAgriculturalInputClassById(argParams);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalInputClassRepositoryImpl.getAgriculturalInputClassById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<ClassEntity>>> getAllAgriculturalInputClasses(NoParams noParams) async {
    try {
      final result = await datasource.getAllAgriculturalInputClasses(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalInputClassRepositoryImpl.getAllAgriculturalInputClasses',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> getAllAgriculturalInputClassesToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllAgriculturalInputClassesToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalInputClassRepositoryImpl.getAllAgriculturalInputClassesToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

}