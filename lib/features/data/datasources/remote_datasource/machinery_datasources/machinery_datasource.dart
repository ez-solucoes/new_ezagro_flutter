import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/machine_implement_models/machine_implement_model.dart';

import '../../../models/pagination_model/pagination_model.dart';

abstract class MachineryDatasource {
  Future<PaginationModel<MachineImplementModel>> getMachinery(
      NoParams noParams);
}
