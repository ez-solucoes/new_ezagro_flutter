import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_list_entities/service_order_list_entity.dart';

abstract class ServiceOrderListUsecase implements Usecase<PaginationEntity<ServiceOrderListEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<ServiceOrderListEntity>>> call(NoParams params);
}