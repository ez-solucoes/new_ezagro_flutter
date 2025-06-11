import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/purchase_request_repositories/purchase_request_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/purchase_request_usecases/cancel_purchase_request_by_id_usecases/cancel_purchase_request_by_id_usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/purchase_request_entities/purchase_request_entity.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../params/arg_params/arg_params.dart';

class CancelPurchaseRequestByIdUsecaseImpl implements CancelPurchaseRequestByIdUsecase {
  final PurchaseRequestRepository repository;

  CancelPurchaseRequestByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<PurchaseRequestEntity>>> call(ArgParams argParams) async {
    return await repository.cancelPurchaseRequestById(argParams);
  }
}