import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import '../../../../../../core/usecase/usecase.dart';
import '../../../../../domain/params/arg_params/arg_params.dart';
import '../../../../models/response_models/response_model.dart';
import '../../../../models/segment_models/segment_model.dart';

abstract class CompanySegmentDatasource {
  Future<List<SegmentModel>> getAllCompanySegments(NoParams noParams);
  Future<ResponseModel<SegmentModel>> getCompanySegmentById(ArgParams argParams);
  Future<List<SelectModel>> getAllCompanySegmentsToSelect(ArgParams argParams);
}