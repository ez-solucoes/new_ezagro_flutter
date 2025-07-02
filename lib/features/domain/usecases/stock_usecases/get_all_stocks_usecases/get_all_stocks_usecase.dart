import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/stock_entities/stock_entity.dart';

import '../../../../../core/errors/application_error.dart';

abstract class GetAllStocksUsecase implements Usecase<ResponseEntity<List<StockEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<StockEntity>>>> call(NoParams noParams);
}