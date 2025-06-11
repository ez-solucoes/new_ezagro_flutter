import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/select_entities/select_entity.dart';

abstract class PurchaseRequestTypeRepository {

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> getAllPurchaseRequestTypesToSelect(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<List<TypeEntity>>>> getAllPurchaseRequestTypes(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<TypeEntity>>> getPurchaseRequestTypesById(ArgParams argParams);
}