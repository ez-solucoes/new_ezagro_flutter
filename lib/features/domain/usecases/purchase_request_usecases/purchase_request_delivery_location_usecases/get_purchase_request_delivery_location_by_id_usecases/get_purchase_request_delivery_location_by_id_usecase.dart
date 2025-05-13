import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../../core/errors/application_error.dart';

abstract class GetPurchaseRequestDeliveryLocationByIdUsecase implements Usecase<TypeEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, TypeEntity>> call(ArgParams argParams);

}