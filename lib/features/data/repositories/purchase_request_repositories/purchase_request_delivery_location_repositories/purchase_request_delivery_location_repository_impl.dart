import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/data/models/type_models/type_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/purchase_request_repositories/purchase_request_delivery_location_repositories/purchase_request_delivery_location_repository.dart';

import '../../../../../core/errors/generic_error.dart';
import '../../../datasources/remote_datasource/purchase_request_datasources/purchase_request_delivery_location_datasources/purchase_request_delivery_location_datasource.dart';

class PurchaseRequestDeliveryLocationRepositoryImpl implements PurchaseRequestDeliveryLocationRepository {
  final PurchaseRequestDeliveryLocationDatasource datasource;

  PurchaseRequestDeliveryLocationRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, List<TypeModel>>> getAllPurchaseRequestDeliveryLocations(NoParams noParams) async {
    try {
      final result = await datasource.getAllPurchaseRequestDeliveryLocations(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestDeliveryLocationRepositoryImpl.getAllPurchaseRequestDeliveryLocations', additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<SelectModel>>> getAllPurchaseRequestDeliveryLocationsToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllPurchaseRequestDeliveryLocationsToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestDeliveryLocationRepositoryImpl.getAllPurchaseRequestDeliveryLocationsToSelect', additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, TypeModel>> getPurchaseRequestDeliveryLocationById(ArgParams argParams) async {
    try {
      final result = await datasource.getPurchaseRequestDeliveryLocationById(argParams);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PurchaseRequestDeliveryLocationRepositoryImpl.getPurchaseRequestDeliveryLocationById', additionalInfo: stacktrace.toString()));
    }
  }
}