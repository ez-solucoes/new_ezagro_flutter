import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/field_service_order_models/field_service_order_model.dart';
import 'package:new_ezagro_flutter/features/data/models/service_order_list_model/service_order_list_model.dart';

import '../../../domain/params/arg_params/arg_params.dart';
import '../../../domain/params/create_service_order_params/create_service_order_params.dart';
import '../../../domain/repositories/service_order_repositories/service_order_repository.dart';
import '../../datasources/remote_datasource/service_order_datasources/service_order_datasource.dart';
import '../../models/pagination_model/pagination_model.dart';

class ServiceOrderRepositoryImpl implements ServiceOrderRepository {
  final ServiceOrderDatasource datasource;

  ServiceOrderRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<FieldServiceOrderModel>>> getServiceOrderList(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllServiceOrders(noParams);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ServiceOrderRepositoryImpl.getServiceOrderList',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, FieldServiceOrderModel>> createServiceOrder(
      MockParams mockParams) async {
    try {
      final result = await datasource.createServiceOrder(mockParams);
      return Right(result.data!);
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
  Future<Either<ApplicationError, ServiceOrderModel>> getServiceOrderById(ArgParams params) async {
    try {
      final result = await datasource.getServiceOrderById(params);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ServiceOrderRepositoryImpl.getServiceOrderById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<ServiceOrderModel>>> getServiceOrderByStatusId(
      ArgParams params) async {
    try {
      final result = await datasource.getAllServiceOrdersByStatusId(params);
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
  Future<Either<ApplicationError, ServiceOrderModel>> approveServiceOrderById(
      ArgParams params) async {
    try {
      final result = await datasource.approveServiceOrderById(params);
      return Right(result.data!);
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
  Future<Either<ApplicationError, ServiceOrderModel>> cancelServiceOrderById(
      ArgParams params) async {
    try {
      final result = await datasource.cancelServiceOrderById(params);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$ServiceOrderRepositoryImpl.cancelServiceOrderById',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }
}
