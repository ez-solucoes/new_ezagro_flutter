import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import '../../../../../core/errors/generic_error.dart';
import '../../../../domain/repositories/purchase_request_repositories/purchase_request_type_repository/purchase_request_type_repository.dart';
import '../../../datasources/remote_datasource/purchase_request_datasources/purchase_request_type_datasource/purchase_request_type_datasource.dart';

class PurchaseRequestTypeRepositoryImpl implements PurchaseRequestTypeRepository {
  final PurchaseRequestTypeDatasource datasource;

  PurchaseRequestTypeRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, List<SelectModel>>> getAllPurchaseRequestTypeToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllPurchaseRequestTypeToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestTypeRepositoryImpl.getAllPurchaseRequestTypeToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }
}