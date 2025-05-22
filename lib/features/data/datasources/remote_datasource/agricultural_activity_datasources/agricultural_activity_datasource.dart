import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/agricultural_models/agricultural_activity_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';


abstract class AgriculturalActivityDatasource {
  Future<List<AgriculturalActivityModel>> getAllAgriculturalActivities(NoParams noParams);
  Future<List<SelectModel>> getAllAgriculturalActivitiesToSelect(NoParams noParams);
  Future<ResponseModel<AgriculturalActivityModel>> getAgriculturalActivityById(ArgParams argParams);
  Future<ResponseModel<AgriculturalActivityModel>> getAgriculturalActivityByTypeId(ArgParams argParams);
}
