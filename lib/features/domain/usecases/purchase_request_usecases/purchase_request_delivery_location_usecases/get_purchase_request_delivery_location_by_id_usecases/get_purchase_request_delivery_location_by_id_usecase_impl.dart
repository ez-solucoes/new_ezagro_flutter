import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../entities/response_entities/response_entity.dart';
import '../../../../repositories/purchase_request_repositories/purchase_request_delivery_location_repositories/purchase_request_delivery_location_repository.dart';
import 'get_purchase_request_delivery_location_by_id_usecase.dart';

class GetPurchaseRequestDeliveryLocationByIdUsecaseImpl implements GetPurchaseRequestDeliveryLocationByIdUsecase {

  final PurchaseRequestDeliveryLocationRepository repository;

  GetPurchaseRequestDeliveryLocationByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<TypeEntity>>> call(ArgParams argParams) async {
    return await repository.getPurchaseRequestDeliveryLocationById(argParams);
  }


}