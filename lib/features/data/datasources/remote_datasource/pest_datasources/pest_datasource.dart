import 'package:new_ezagro_flutter/features/data/models/pest_models/pest_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../models/pagination_model/pagination_model.dart';
import '../../../models/response_models/response_model.dart';

abstract class PestDatasource {
  Future<ResponseModel<List<PestModel>>> getAllPests(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllPestsToSelect(NoParams noParams);
  Future<ResponseModel<PestModel>> getPestById(ArgParams argParams);
}
