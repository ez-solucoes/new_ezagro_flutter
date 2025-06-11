import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/payment_method_entities/payment_method_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class PaymentMethodRepository {
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> getAllPaymentMethodsToSelect(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<List<PaymentMethodEntity>>>> getAllPaymentMethods(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<PaymentMethodEntity>>> getPaymentMethodsById(ArgParams argParams);
}