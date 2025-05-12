import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import '../../../../core/usecase/usecase.dart';
import '../../entities/purchase_request_entities/purchase_request_entity.dart';
import '../../entities/select_entities/select_entity.dart';
import '../../params/arg_params/arg_params.dart';

abstract class PurchaseRequestRepository {
  Future<Either<ApplicationError, List<PurchaseRequestEntity>>> getAllPurchaseRequest(NoParams noParams);
  Future<Either<ApplicationError, List<SelectEntity>>> getAllPurchaseRequestToSelect(NoParams noParams);

  Future<Either<ApplicationError, PurchaseRequestEntity>> getPurchaseRequestById(ArgParams argParams);

  Future<Either<ApplicationError, List<PurchaseRequestEntity>>> getPurchaseRequestByStatusId(ArgParams argParams);

  Future<Either<ApplicationError, PurchaseRequestEntity>> approvePurchaseRequestById(ArgParams argParams);

  Future<Either<ApplicationError, PurchaseRequestEntity>> cancelPurchaseRequestById(ArgParams argParams);
  Future<Either<ApplicationError, PurchaseRequestEntity>> createPurchaseRequest(ArgParams argParams);

}