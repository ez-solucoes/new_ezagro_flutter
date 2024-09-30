import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/mock_model/mock_model.dart';
import '../../models/pagination_model/pagination_model.dart';

abstract class CropDatasource {
  Future<PaginationModel<MockModel>> getSimplifiedCrops(NoParams noParams);

}