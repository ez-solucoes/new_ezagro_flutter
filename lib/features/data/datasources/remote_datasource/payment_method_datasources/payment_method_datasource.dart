import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

abstract class PaymentMethodDatasource {
  Future<List<SelectModel>> getAllPaymentMethodsToSelect(NoParams noParams);
}