import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/payment_method_repositories/payment_method_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/payment_method_usecases/get_all_payment_methods_to_select_usecase/get_all_payment_methods_to_select_usecase.dart';

class GetAllPaymentMethodsToSelectUsecaseImpl implements GetAllPaymentMethodsToSelectUsecase {
  final PaymentMethodRepository repository;

  GetAllPaymentMethodsToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(NoParams noParams) async {
    return await repository.getAllPaymentMethodsToSelect(noParams);
  }

}