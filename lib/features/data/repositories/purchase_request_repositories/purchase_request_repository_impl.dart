import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/purchase_request_datasources/purchase_request_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/purchase_request_models/purchase_request_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/purchase_request_repositories/purchase_request_repository.dart';

import '../../../../core/errors/generic_error.dart';

class PurchaseRequestRepositoryImpl implements PurchaseRequestRepository {
  final PurchaseRequestDatasource datasource;

  PurchaseRequestRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<PurchaseRequestModel>>>>
      getAllPurchaseRequest(NoParams noParams) async {
    try {
      final result = await datasource.getAllPurchaseRequests(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestRepositoryImpl.getAllPurchaseRequest',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<PurchaseRequestModel>>>
      getPurchaseRequestById(ArgParams argParams) async {
    try {
      final result = await datasource.getPurchaseRequestById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestRepositoryImpl.getPurchaseRequestById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<PurchaseRequestModel>>>>
      getPurchaseRequestByStatusId(ArgParams argParams) async {
    try {
      final result = await datasource.getAllPurchaseRequestsByStatusId(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestRepositoryImpl.getPurchaseRequestByStatusId',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<PurchaseRequestModel>>>
      approvePurchaseRequestById(ArgParams argParams) async {
    try {
      final result = await datasource.approvePurchaseRequestById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestRepositoryImpl.approvePurchaseRequestById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<PurchaseRequestModel>>>
      cancelPurchaseRequestById(ArgParams argParams) async {
    try {
      final result = await datasource.cancelPurchaseRequestById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestRepositoryImpl.cancelPurchaseRequestById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>>
      getAllPurchaseRequestToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllPurchaseRequestsToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestRepositoryImpl.getAllPurchaseRequest',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<PurchaseRequestModel>>>
      createPurchaseRequest(ArgParams argParams) async {
    try {
      final result = await datasource.createPurchaseRequest(argParams);
      return Right(result);
    } on ApplicationError catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestRepositoryImpl.createPurchaseRequest',
          additionalInfo: stacktrace.toString()));
    }
  }
}
