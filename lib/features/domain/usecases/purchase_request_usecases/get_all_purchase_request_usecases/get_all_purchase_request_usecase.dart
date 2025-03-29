import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/purchase_request_entity.dart';

import '../../../../../core/errors/application_error.dart';

abstract class GetAllPurchaseRequestUsecase
    implements Usecase<List<PurchaseRequestEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<PurchaseRequestEntity>>> call(NoParams noParams);
}
