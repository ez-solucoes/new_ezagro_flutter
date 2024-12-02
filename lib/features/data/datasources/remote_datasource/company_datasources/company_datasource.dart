import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import '../../../models/company_models/company_model.dart';

abstract class CompanyDatasource {
  Future<List<CompanyModel>> getAllCompanies(NoParams noParams);

  Future<CompanyModel> getCompanyById(ArgParams argParams);
}
