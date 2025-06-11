import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import '../../../../entities/response_entities/response_entity.dart';

abstract class GetAllPurchaseRequestDeliveryLocationsUsecase implements Usecase<ResponseEntity<List<TypeEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<TypeEntity>>>> call(NoParams noParams);
}