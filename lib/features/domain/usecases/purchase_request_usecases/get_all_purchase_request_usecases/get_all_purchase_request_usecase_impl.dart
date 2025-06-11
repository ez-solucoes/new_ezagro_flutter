import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/purchase_request_repositories/purchase_request_repository.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../entities/purchase_request_entities/purchase_request_entity.dart';
import '../../../entities/response_entities/response_entity.dart';
import 'get_all_purchase_request_usecase.dart';

class GetAllPurchaseRequestUsecaseImpl implements GetAllPurchaseRequestUsecase {
  final PurchaseRequestRepository repository;

  GetAllPurchaseRequestUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<PurchaseRequestEntity>>>> call(NoParams noParams) async {
    return await repository.getAllPurchaseRequest(noParams);
  }
}
