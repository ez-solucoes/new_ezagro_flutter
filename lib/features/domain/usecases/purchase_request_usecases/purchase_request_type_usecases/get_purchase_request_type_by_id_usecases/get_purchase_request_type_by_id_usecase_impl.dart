import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/purchase_request_repositories/purchase_request_type_repository/purchase_request_type_repository.dart';

import 'get_purchase_request_type_by_id_usecase.dart';

class GetPurchaseRequestTypeByIdUsecaseImpl implements GetPurchaseRequestTypeByIdUsecase{
  final PurchaseRequestTypeRepository repository;

  const GetPurchaseRequestTypeByIdUsecaseImpl(this.repository);
  @override
  Future<Either<ApplicationError, ResponseEntity<TypeEntity>>> call(ArgParams argParams) async {
    return await repository.getPurchaseRequestTypesById(argParams);
  }
}