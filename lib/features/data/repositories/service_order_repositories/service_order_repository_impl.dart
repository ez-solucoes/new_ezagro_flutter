import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/service_order_list_model/service_order_list_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../domain/params/arg_params/arg_params.dart';
import '../../../domain/repositories/service_order_repositories/service_order_repository.dart';
import '../../datasources/remote_datasource/service_order_datasources/service_order_datasource.dart';

class ServiceOrderRepositoryImpl implements ServiceOrderRepository {
  final ServiceOrderDatasource datasource;

  ServiceOrderRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<ServiceOrderModel>>>>
      getAllServiceOrders(NoParams noParams) async {
    try {
      final result = await datasource.getAllServiceOrders(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ServiceOrderRepositoryImpl.getAllServiceOrders',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<ServiceOrderModel>>> createServiceOrder(
      ArgParams argParams) async {
    try {
      final result = await datasource.createServiceOrder(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$ServiceOrderRepositoryImpl.createServiceOrder',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<ServiceOrderModel>>> getServiceOrderById(
      ArgParams argParams) async {
    try {
      final result = await datasource.getServiceOrderById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ServiceOrderRepositoryImpl.getServiceOrderById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<ServiceOrderModel>>>>
      getAllServiceOrdersByStatusId(ArgParams argParams) async {
    try {
      final result = await datasource.getAllServiceOrdersByStatusId(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$ServiceOrderRepositoryImpl.getServiceOrderByStatusId',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<ServiceOrderModel>>>
      approveServiceOrderById(ArgParams argParams) async {
    try {
      final result = await datasource.approveServiceOrderById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$ServiceOrderRepositoryImpl.approveServiceOrderById',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<ServiceOrderModel>>>
      cancelServiceOrderById(ArgParams argParams) async {
    try {
      final result = await datasource.cancelServiceOrderById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$ServiceOrderRepositoryImpl.cancelServiceOrderById',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllServiceOrdersToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllServiceOrdersToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$ServiceOrderRepositoryImpl.getAllServiceOrdersToSelect',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }
}
