import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

import '../../entities/field_service_order_entities/field_service_order_entity.dart';

abstract class ServiceOrderListUsecase
    implements Usecase<PaginationEntity<FieldServiceOrderEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<FieldServiceOrderEntity>>>
      call(NoParams params);
}
