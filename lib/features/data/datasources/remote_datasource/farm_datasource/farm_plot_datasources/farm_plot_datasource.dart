import 'package:new_ezagro_flutter/features/data/models/plot_models/farm_plot_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class FarmPlotDatasource {

  Future<List<FarmPlotModel>> getAllFarmPlots(ArgParams argParams);
  Future<List<SelectModel>> getAllFarmPlotsToSelect(ArgParams argParams);
  Future<ResponseModel<FarmPlotModel>> getFarmPlotById(ArgParams argParams);

}