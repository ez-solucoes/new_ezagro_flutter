import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/data/models/stock_models/stock_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class StockDatasource {

  Future<ResponseModel<List<StockModel>>> getAllStocks(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllStocksToSelect(NoParams noParams);
  Future<ResponseModel<StockModel>> getStockById(ArgParams argParams);
}