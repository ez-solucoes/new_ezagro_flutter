import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/plot_models/plot_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../models/select_models/select_model.dart';

abstract class PlotsDatasource {
  Future<ResponseModel<List<PlotModel>>> getAllPlots(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllPlotsToSelect(NoParams noParams);
  Future<ResponseModel<List<PlotModel>>> getAllPlotsByFarmId(ArgParams argParams);
  Future<ResponseModel<PlotModel>> getPlotById(ArgParams argParams);
}
