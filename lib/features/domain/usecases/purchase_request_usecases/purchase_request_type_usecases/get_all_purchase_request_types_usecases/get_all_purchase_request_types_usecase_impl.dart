import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/purchase_request_repositories/purchase_request_type_repository/purchase_request_type_repository.dart';

import 'get_all_purchase_request_types_usecase.dart';

class GetAllPurchaseRequestTypesUsecaseImpl implements GetAllPurchaseRequestTypesUsecase{
  final PurchaseRequestTypeRepository repository;

  const GetAllPurchaseRequestTypesUsecaseImpl(this.repository);
  @override
  Future<Either<ApplicationError, ResponseEntity<List<TypeEntity>>>> call(NoParams noParams) async {
    return await repository.getAllPurchaseRequestTypes(noParams);
  }
}