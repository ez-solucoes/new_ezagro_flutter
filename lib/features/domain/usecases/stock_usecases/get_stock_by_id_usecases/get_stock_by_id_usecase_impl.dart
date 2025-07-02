import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/stock_entities/stock_entity.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../repositories/stock_repositories/stock_repository.dart';
import 'get_stock_by_id_usecase.dart';

class GetStockByIdUsecaseImpl implements GetStockByIdUsecase{

  final StockRepository repository;

  GetStockByIdUsecaseImpl(this.repository);
  @override
  Future<Either<ApplicationError, ResponseEntity<StockEntity>>> call(ArgParams params) async {
    return await repository.getStockById(params);
  }
}