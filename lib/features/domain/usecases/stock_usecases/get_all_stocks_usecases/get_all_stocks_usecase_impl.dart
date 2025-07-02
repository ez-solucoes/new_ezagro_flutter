import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/stock_entities/stock_entity.dart';

import '../../../repositories/stock_repositories/stock_repository.dart';
import 'get_all_stocks_usecase.dart';

class GetAllStocksUsecaseImpl implements GetAllStocksUsecase{
  final StockRepository repository;

  GetAllStocksUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<StockEntity>>>> call(NoParams noParams) async {
    return await repository.getAllStocks(noParams);
  }
}