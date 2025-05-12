import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/products_models/product_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../domain/repositories/product_repositories/product_repository.dart';
import '../../datasources/remote_datasource/product_datasources/product_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource datasource;

  ProductRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, List<ProductModel>>> getAllProducts(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllProducts(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ProductRepositoryImpl.getProducts',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<SelectModel>>> getAllProductsToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllProductsToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ProductRepositoryImpl.getAllProductsToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<ProductModel>>> getAllProductsByTypeId(ArgParams argParams) async {
    try {
      final result = await datasource.getAllProductsByTypeId(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ProductRepositoryImpl.getAllProductsByTypeId',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<SelectModel>>> getAllProductsByTypeIdToSelect(ArgParams argParams) async {
    try {
      final result = await datasource.getAllProductsByTypeIdToSelect(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ProductRepositoryImpl.getAllProductsByTypeIdToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<ProductModel>>> getProductById(ArgParams argParams) async {
    try {
      final result = await datasource.getProductById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ProductRepositoryImpl.getProductById',
          additionalInfo: stacktrace.toString()));
    }
  }
}
