import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../entities/select_entities/select_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class PurchaseRequestDeliveryLocationRepository {
  Future<Either<ApplicationError, List<TypeEntity>>> getAllPurchaseRequestDeliveryLocations(NoParams noParams);
  Future<Either<ApplicationError, List<SelectEntity>>> getAllPurchaseRequestDeliveryLocationsToSelect(NoParams noParams);
  Future<Either<ApplicationError, TypeEntity>> getPurchaseRequestDeliveryLocationById(ArgParams argParams);
}