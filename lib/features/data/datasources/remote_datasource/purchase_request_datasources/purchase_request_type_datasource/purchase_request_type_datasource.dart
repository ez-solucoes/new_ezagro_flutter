import '../../../../../../core/usecase/usecase.dart';
import '../../../../models/select_models/select_model.dart';

abstract class PurchaseRequestTypeDatasource {
  Future<List<SelectModel>> getAllPurchaseRequestTypeToSelect(NoParams noParams);
}