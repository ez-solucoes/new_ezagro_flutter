import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/plot_models/plot_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../models/pagination_model/pagination_model.dart';

abstract class PlotsDatasource {
  Future<PaginationModel<PlotModel>> getPlots(NoParams noParams);

  Future<PaginationModel<PlotModel>> getPlotByFarmId(ArgParams params);
}