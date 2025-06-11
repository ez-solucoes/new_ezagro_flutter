import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../entities/select_entities/select_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class PurchaseRequestDeliveryLocationRepository {
  Future<Either<ApplicationError, ResponseEntity<List<TypeEntity>>>>
      getAllPurchaseRequestDeliveryLocations(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllPurchaseRequestDeliveryLocationsToSelect(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<TypeEntity>>>
      getPurchaseRequestDeliveryLocationById(ArgParams argParams);
}
