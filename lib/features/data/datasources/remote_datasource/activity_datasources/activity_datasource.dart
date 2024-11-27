import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/agricultural_models/agricultural_activity_model.dart';

import '../../../models/pagination_model/pagination_model.dart';

abstract class ActivityDatasource {
  Future<PaginationModel<AgriculturalActivityModel>> getActivities(
      NoParams noParams);
}
