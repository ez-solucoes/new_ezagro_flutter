import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/data/models/type_models/type_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/generic_error.dart';
import '../../../../domain/repositories/purchase_request_repositories/purchase_request_type_repository/purchase_request_type_repository.dart';
import '../../../datasources/remote_datasource/purchase_request_datasources/purchase_request_type_datasource/purchase_request_type_datasource.dart';

class PurchaseRequestTypeRepositoryImpl implements PurchaseRequestTypeRepository {
  final PurchaseRequestTypeDatasource datasource;

  PurchaseRequestTypeRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>> getAllPurchaseRequestTypesToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllPurchaseRequestTypesToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestTypeRepositoryImpl.getAllPurchaseRequestTypesToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseEntity<List<TypeModel>>>> getAllPurchaseRequestTypes(NoParams noParams) async {
    try {
      final result = await datasource.getAllPurchaseRequestTypes(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestTypeRepositoryImpl.getAllPurchaseRequestTypes',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseEntity<TypeEntity>>> getPurchaseRequestTypesById(ArgParams argParams) async {
    try {
      final result = await datasource.getPurchaseRequestTypesById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestTypeRepositoryImpl.getPurchaseRequestTypesById',
          additionalInfo: stacktrace.toString()));
    }
  }
}