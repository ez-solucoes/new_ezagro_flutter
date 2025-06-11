import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/payment_method_models/payment_method_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class PaymentMethodDatasource {
  Future<ResponseModel<List<SelectModel>>> getAllPaymentMethodsToSelect(NoParams noParams);
  Future<ResponseModel<List<PaymentMethodModel>>> getAllPaymentMethods(NoParams noParams);
  Future<ResponseModel<PaymentMethodModel>> getPaymentMethodsById(ArgParams argParams);
}