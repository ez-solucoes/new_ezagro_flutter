
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import '../../../models/company_models/company_model.dart';

abstract class CompanyDatasource {
  Future<ResponseModel<List<CompanyModel>>> getAllCompanies(NoParams noParams);
  Future<ResponseModel<CompanyModel>> getCompanyById(ArgParams argParams);
  Future<ResponseModel<List<SelectModel>>> getAllCompaniesToSelect(NoParams noParams);
}
