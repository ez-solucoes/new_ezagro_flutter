import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import '../../../models/company_models/company_model.dart';

abstract class CompanyDatasource {
  Future<List<CompanyModel>> getAllCompanies(NoParams noParams);
}
