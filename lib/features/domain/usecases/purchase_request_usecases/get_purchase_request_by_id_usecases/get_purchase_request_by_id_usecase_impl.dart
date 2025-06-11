import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/purchase_request_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/purchase_request_usecases/get_purchase_request_by_id_usecases/get_purchase_request_by_id_usecase.dart';

import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/purchase_request_repositories/purchase_request_repository.dart';

class GetPurchaseRequestByIdUsecaseImpl implements GetPurchaseRequestByIdUsecase {
  final PurchaseRequestRepository repository;

  GetPurchaseRequestByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<PurchaseRequestEntity>>> call(ArgParams argParams) async {
    return await repository.getPurchaseRequestById(argParams);
  }
}
