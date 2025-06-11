import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/cost_center_models/cost_center_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/cost_center_repositories/cost_center_repository.dart';

import '../../datasources/remote_datasource/cost_center_datasource/cost_center_datasource.dart';

class CostCenterRepositoryImpl implements CostCenterRepository {
  final CostCenterDatasource datasource;

  CostCenterRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<CostCenterModel>>>>
      getAllCostCenters(NoParams noParams) async {
    try {
      final result = await datasource.getAllCostCenters(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CostCenterRepositoryImpl.getAllCostCenters',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<CostCenterModel>>>>
      getAllCostCentersByCostCenterTypeId(ArgParams argParams) async {
    try {
      final result = await datasource.getAllCostCentersByCostCenterTypeId(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CostCenterRepositoryImpl.getAllCostCentersByCostCenterTypeId',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>>
      getAllCostCentersByCostCenterTypeIdToSelect(ArgParams argParams) async {
    try {
      final result =
          await datasource.getAllCostCentersByCostCenterTypeIdToSelect(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint:
              '$CostCenterRepositoryImpl.getAllCostCentersByCostCenterTypeIdToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>>
      getAllCostCentersToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllCostCentersToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CostCenterRepositoryImpl.getAllCostCentersToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<CostCenterModel>>> getCostCenterById(
      ArgParams argParams) async {
    try {
      final result = await datasource.getCostCenterById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CostCenterRepositoryImpl.getCostCenterById',
          additionalInfo: stacktrace.toString()));
    }
  }
}
