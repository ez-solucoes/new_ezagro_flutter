import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/payment_method_datasources/payment_method_datasource.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/payment_method_repositories/payment_method_repository.dart';

import '../../../../core/errors/generic_error.dart';

class PaymentMethodRepositoryImpl implements PaymentMethodRepository {
  final PaymentMethodDatasource datasource;

  PaymentMethodRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> getAllPaymentMethodsToSelect(NoParams noParams) async {
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
}