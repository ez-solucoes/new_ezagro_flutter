import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/machinery_implement_models/machinery_implement_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/machinery_implement_repositories/machinery_implement_repository.dart';

import '../../datasources/remote_datasource/machinery_implement_datasources/machinery_implement_datasource.dart';

class MachineryImplementRepositoryImpl implements MachineryImplementRepository {
  final MachineryImplementDatasource datasource;

  MachineryImplementRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>> getAllMachineryImplementsToSelect(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllMachineryImplementsToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$MachineryImplementRepositoryImpl.getAllMachineryImplementsToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<MachineryImplementModel>>>> getAllMachineryImplements(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllMachineryImplements(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$MachineryImplementRepositoryImpl.getAllMachineryImplements',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<MachineryImplementEntity>>>
      getMachineryImplementById(ArgParams argParams) async {
    try {
      final result = await datasource.getMachineryImplementById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$MachineryImplementRepositoryImpl.getMachineryImplementById',
          additionalInfo: stacktrace.toString()));
    }
  }
}
