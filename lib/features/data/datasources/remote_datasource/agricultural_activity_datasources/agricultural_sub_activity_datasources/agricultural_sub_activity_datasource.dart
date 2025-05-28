import 'package:new_ezagro_flutter/features/data/models/agricultural_models/agricultural_sub_activity_models/agricultural_sub_activity_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';

import '../../../../../../core/usecase/usecase.dart';
import '../../../../../domain/params/arg_params/arg_params.dart';
import '../../../../models/select_models/select_model.dart';

abstract class AgriculturalSubActivityDatasource {
  Future<List<AgriculturalSubActivityModel>> getAllAgriculturalSubActivities(NoParams noParams);
  Future<List<SelectModel>> getAllAgriculturalSubActivitiesToSelect(NoParams noParams);
  Future<List<SelectModel>> getAllAgriculturalSubActivitiesByActivityIdToSelect(ArgParams argParams);
  Future<ResponseModel<AgriculturalSubActivityModel>> getAgriculturalSubActivityById(ArgParams argParams);

}