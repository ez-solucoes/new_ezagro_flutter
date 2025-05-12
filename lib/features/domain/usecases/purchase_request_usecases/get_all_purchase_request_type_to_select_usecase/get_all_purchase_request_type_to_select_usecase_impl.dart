import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../repositories/purchase_request_repositories/purchase_request_type_repository/purchase_request_type_repository.dart';
import 'get_all_purchase_request_type_to_select_usecase.dart';

class GetAllPurchaseRequestTypeToSelectUsecaseImpl implements GetAllPurchaseRequestTypeToSelectUsecase {
  final PurchaseRequestTypeRepository repository;

  GetAllPurchaseRequestTypeToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(NoParams noParams) async {
    return await repository.getAllPurchaseRequestTypeToSelect(noParams);
  }


}