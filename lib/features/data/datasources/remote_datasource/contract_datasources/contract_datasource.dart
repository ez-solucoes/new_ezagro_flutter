import '../../../../../core/usecase/usecase.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../models/contract_models/contract_model.dart';
import '../../../models/response_models/response_model.dart';
import '../../../models/select_models/select_model.dart';

abstract class ContractDatasource {
  Future<ResponseModel<List<ContractModel>>> getAllContracts(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllContractsToSelect(NoParams noParams);
  Future<ResponseModel<ContractModel>> getContractById(ArgParams argParams);
}