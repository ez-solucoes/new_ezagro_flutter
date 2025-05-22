import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/type_models/type_model.dart';

import '../../../../../domain/params/arg_params/arg_params.dart';
import '../../../../models/response_models/response_model.dart';
import '../../../../models/select_models/select_model.dart';

abstract class AgriculturalActivityTypeDatasource {
  Future<List<TypeModel>> getAllAgriculturalActivityTypes(NoParams noParams);
  Future<List<SelectModel>> getAllAgriculturalActivityTypesToSelect(NoParams noParams);
  Future<ResponseModel<TypeModel>> getAgriculturalActivityTypeById(ArgParams argParams);
}
