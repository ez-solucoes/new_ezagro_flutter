import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

abstract class GetAllPurchaseRequestDeliveryLocationsUsecase implements Usecase<List<TypeEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<TypeEntity>>> call(NoParams noParams);
}