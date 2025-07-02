import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/stock_datasources/stock_datasource.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/stock_entities/stock_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../core/errors/generic_error.dart';
import '../../../domain/repositories/stock_repositories/stock_repository.dart';

class StockRepositoryImpl implements StockRepository {
  final StockDatasource datasource;

  StockRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<StockEntity>>>> getAllStocks(NoParams noParams) async {
    try {
      final result = await datasource.getAllStocks(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$StockRepositoryImpl.getAllStocks',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> getAllStocksToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllStocksToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$StockRepositoryImpl.getAllStocksToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseEntity<StockEntity>>> getStockById(ArgParams argParams) async {
    try {
      final result = await datasource.getStockById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$StockRepositoryImpl.getStockById',
          additionalInfo: stacktrace.toString()));
    }
  }
}