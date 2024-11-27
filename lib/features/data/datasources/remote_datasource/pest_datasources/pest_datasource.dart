import 'package:new_ezagro_flutter/features/data/models/pest_models/pest_model.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../models/pagination_model/pagination_model.dart';
import '../../../models/response_models/response_model.dart';

abstract class PestDatasource {
  Future<ResponseModel<PaginationModel<PestModel>>> getPests(
      NoParams noParams);
}
