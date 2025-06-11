import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../entities/response_entities/response_entity.dart';

abstract class GetAllPaymentMethodsToSelectUsecase implements Usecase<ResponseEntity<List<SelectEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(NoParams params);

}