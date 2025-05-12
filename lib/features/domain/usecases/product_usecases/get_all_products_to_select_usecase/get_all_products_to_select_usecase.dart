import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../../core/usecase/usecase.dart';

abstract class GetAllProductsToSelectUsecase implements Usecase<List<SelectEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(NoParams params);
}