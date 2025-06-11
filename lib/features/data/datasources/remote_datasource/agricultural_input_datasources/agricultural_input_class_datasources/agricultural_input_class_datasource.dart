import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/class_models/class_model.dart';

import '../../../../../domain/params/arg_params/arg_params.dart';
import '../../../../models/response_models/response_model.dart';
import '../../../../models/select_models/select_model.dart';

abstract class AgriculturalInputClassDatasource {
  Future<ResponseModel<List<ClassModel>>> getAllAgriculturalInputClasses(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllAgriculturalInputClassesToSelect(NoParams noParams);
  Future<ResponseModel<ClassModel>> getAgriculturalInputClassById(ArgParams argParams);
}