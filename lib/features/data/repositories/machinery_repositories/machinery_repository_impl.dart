import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/machinery_implement_models/machinery_implement_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/machinery_repositories/machinery_repository.dart';

import '../../datasources/remote_datasource/machinery_datasources/machinery_datasource.dart';
import '../../models/pagination_model/pagination_model.dart';

class MachineryRepositoryImpl implements MachineryRepository {
  final MachineryImplementDatasource datasource;

  MachineryRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<MachineryImplementModel>>> getMachinery(
      NoParams noParams) async {
    try {
      final result = await datasource.getMachinery(noParams);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$MachineryRepositoryImpl.getMachinery',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<MachineryImplementEntity>>> getAllMachineryImplements(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllMachineryImplement(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$MachineryRepositoryImpl.getAllMachineryImplements',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<MachineryImplementEntity>>>
      getMachineryImplementById(int id) async {
    try {
      final result = await datasource.getMachineryImplementById(id);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$MachineryRepositoryImpl.getMachineryImplementById',
          additionalInfo: stacktrace.toString()));
    }
  }
}
