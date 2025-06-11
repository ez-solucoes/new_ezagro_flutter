import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import '../../../../entities/response_entities/response_entity.dart';
import '../../../../repositories/purchase_request_repositories/purchase_request_delivery_location_repositories/purchase_request_delivery_location_repository.dart';
import 'get_all_purchase_request_delivery_locations_usecase.dart';

class GetAllPurchaseRequestDeliveryLocationsUsecaseImpl implements GetAllPurchaseRequestDeliveryLocationsUsecase {
  final PurchaseRequestDeliveryLocationRepository repository;

  GetAllPurchaseRequestDeliveryLocationsUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<TypeEntity>>>> call(NoParams noParams) async {
    return await repository.getAllPurchaseRequestDeliveryLocations(noParams);
  }


}