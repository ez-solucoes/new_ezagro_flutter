import 'package:dartz/dartz.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../entities/contract_entities/contract_entity.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../params/arg_params/arg_params.dart';
import '../../../repositories/contract_repositories/contract_repository.dart';
import 'get_contract_by_id_usecase.dart';

class GetContractByIdUsecaseImpl implements GetContractByIdUsecase {

  final ContractRepository repository;

  GetContractByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<ContractEntity>>> call(
      ArgParams argParams) async {
    return await repository.getContractById(argParams);
  }
}