import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/purchase_request_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/purchase_request_repositories/purchase_request_repository.dart';

import '../../../entities/response_entities/response_entity.dart';
import 'create_purchase_request_usecase.dart';

class CreatePurchaseRequestUsecaseImpl implements CreatePurchaseRequestUsecase {
  final PurchaseRequestRepository repository;

  CreatePurchaseRequestUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<PurchaseRequestEntity>>> call(ArgParams argParams) async {
    return await repository.createPurchaseRequest(argParams);
  }

}