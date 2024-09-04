import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_list_entities/service_order_list_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/service_order_list_repositories/service_order_list_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_list_usecase/service_order_list_usecase.dart';
import '../../../../core/errors/application_error.dart';

class ServiceOrderListUsecaseImpl implements ServiceOrderListUsecase {

  final ServiceOrderListRepository repository;

  ServiceOrderListUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<ServiceOrderListEntity>>> call(NoParams noParams) async {
    return await repository.getServiceOrderList(noParams);
  }
}