import 'package:dartz/dartz.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/select_entities/select_entity.dart';

abstract class PurchaseRequestTypeRepository {

  Future<Either<ApplicationError, List<SelectEntity>>> getAllPurchaseRequestTypeToSelect(NoParams noParams);
}