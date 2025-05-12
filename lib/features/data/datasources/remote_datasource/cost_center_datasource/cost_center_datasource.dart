import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/cost_center_models/cost_center_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import '../../../models/pagination_model/pagination_model.dart';

abstract class CostCenterDatasource {
  Future<ResponseModel<PaginationModel<CostCenterModel>>> getCostCenters(NoParams noParams);

  Future<List<SelectModel>> getAllCostCenterToSelect(NoParams noParams);
}
