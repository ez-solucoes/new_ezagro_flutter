import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/purchase_request_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../repositories/purchase_request_repositories/purchase_request_repository.dart';
import 'get_purchase_request_by_status_id_usecase.dart';

class GetPurchaseRequestByStatusIdUsecaseImpl implements GetPurchaseRequestByStatusIdUsecase {
  final PurchaseRequestRepository repository;

  GetPurchaseRequestByStatusIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<PurchaseRequestEntity>>> call(ArgParams argParams) async {
    return await repository.getPurchaseRequestByStatusId(argParams);
  }
}
