

import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/service_order_list_datasources/service_order_list_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/service_order_list_model/service_order_list_model.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/service_order_list_repositories/service_order_list_repository.dart';

class ServiceOrderListRepositoryImpl implements ServiceOrderListRepository {

  final ServiceOrderListDatasource datasource;

  ServiceOrderListRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, List<ServiceOrderListModel>>> getServiceOrderList(NoParams noParams) async {

    try{
      final result = await datasource.getServiceOrderList(noParams);
      return Right(result);
    } on ApplicationError catch(e) {
      return Left(e);
    } catch(e, stacktrace) {
        return Left(
        GenericError(
          fingerprint: '$ServiceOrderListRepositoryImpl.getServiceOrderList',
          additionalInfo: stacktrace.toString()
        )
      );
    }
  }

}