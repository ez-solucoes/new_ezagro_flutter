import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import '../../../models/company_models/company_model.dart';
import '../../../models/response_models/response_model.dart';

abstract class CompanyDatasource {
  Future<ResponseModel<List<CompanyModel>>> getAllCompanies(NoParams noParams);
}
