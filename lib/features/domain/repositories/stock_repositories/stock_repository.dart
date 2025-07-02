import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/stock_entities/stock_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../../entities/select_entities/select_entity.dart';
import '../../params/arg_params/arg_params.dart';

abstract class StockRepository {
  Future<Either<ApplicationError, ResponseEntity<List<StockEntity>>>> getAllStocks(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> getAllStocksToSelect(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<StockEntity>>> getStockById(ArgParams argParams);
}