import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/machinery_implement_models/machinery_implement_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import '../../../models/pagination_model/pagination_model.dart';

abstract class MachineryImplementDatasource {
  Future<ResponseModel<List<MachineryImplementModel>>> getAllMachineryImplements(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllMachineryImplementsToSelect(NoParams noParams);
  Future<ResponseModel<MachineryImplementModel>> getMachineryImplementById(int id);
}
