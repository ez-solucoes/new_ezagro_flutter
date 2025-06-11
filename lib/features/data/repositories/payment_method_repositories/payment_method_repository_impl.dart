import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/payment_method_datasources/payment_method_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/payment_method_models/payment_method_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/payment_method_repositories/payment_method_repository.dart';

import '../../../../core/errors/generic_error.dart';

class PaymentMethodRepositoryImpl implements PaymentMethodRepository {
  final PaymentMethodDatasource datasource;

  PaymentMethodRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>>
      getAllPaymentMethodsToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllPaymentMethodsToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PaymentMethodRepositoryImpl.getAllPaymentMethodsToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<PaymentMethodModel>>>>
      getAllPaymentMethods(NoParams noParams) async {
    try {
      final result = await datasource.getAllPaymentMethods(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PaymentMethodRepositoryImpl.getAllPaymentMethods',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<PaymentMethodModel>>>
      getPaymentMethodsById(ArgParams argParams) async {
    try {
      final result = await datasource.getPaymentMethodsById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PaymentMethodRepositoryImpl.getPaymentMethodsById',
          additionalInfo: stacktrace.toString()));
    }
  }
}
