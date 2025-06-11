import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../entities/response_entities/response_entity.dart';
import '../../../../repositories/purchase_request_repositories/purchase_request_type_repository/purchase_request_type_repository.dart';
import 'get_all_purchase_request_types_to_select_usecase.dart';

class GetAllPurchaseRequestTypesToSelectUsecaseImpl implements GetAllPurchaseRequestTypesToSelectUsecase {
  final PurchaseRequestTypeRepository repository;

  GetAllPurchaseRequestTypesToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(NoParams noParams) async {
    return await repository.getAllPurchaseRequestTypesToSelect(noParams);
  }


}