import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import '../../../../entities/select_entities/select_entity.dart';
import '../../../../repositories/purchase_request_repositories/purchase_request_delivery_location_repositories/purchase_request_delivery_location_repository.dart';
import 'get_all_purchase_request_delivery_locations_to_select_usecase.dart';

class GetAllPurchaseRequestDeliveryLocationsToSelectUsecaseImpl implements GetAllPurchaseRequestDeliveryLocationsToSelectUsecase {
  final PurchaseRequestDeliveryLocationRepository repository;

  GetAllPurchaseRequestDeliveryLocationsToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(NoParams noParams) async {
    return await repository.getAllPurchaseRequestDeliveryLocationsToSelect(noParams);
  }
}