import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/product_datasources/product_type_datasources/product_type_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import '../../../../core/errors/generic_error.dart';
import '../../../domain/params/arg_params/arg_params.dart';
import '../../../domain/repositories/product_repositories/product_type_repository.dart';
import '../../models/products_models/product_type_model.dart';

class ProductTypeRepositoryImpl implements ProductTypeRepository {
  final ProductTypeDatasource datasource;

  ProductTypeRepositoryImpl({required this.datasource});

  @override
  Future<Either<ApplicationError, List<ProductTypeModel>>> getAllProductTypes(NoParams noParams) async {
    try {
      final result = await datasource.getAllProductTypes(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ProductTypeRepositoryImpl.getAllProductTypes',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<SelectModel>>> getAllProductTypesToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllProductTypesToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ProductTypeRepositoryImpl.getAllProductTypesToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ProductTypeModel>> getProductTypeById(ArgParams argParams) async {
    try {
      final result = await datasource.getProductTypeById(argParams);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ProductTypeRepositoryImpl.getProductTypeById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<SelectModel>>> getFilteredProductTypesToSelect(ArgParams argParams) async {
    try {
      final result = await datasource.getFilteredProductTypesToSelect(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ProductTypeRepositoryImpl.getFilteredProductTypesToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

}