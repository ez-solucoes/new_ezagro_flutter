import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../entities/service_order_entities/service_order_entity.dart';

abstract class GetAllServiceOrdersUsecase
    implements Usecase<ResponseEntity<List<ServiceOrderEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<ServiceOrderEntity>>>>
      call(NoParams params);
}
