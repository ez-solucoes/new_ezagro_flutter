import 'package:dartz/dartz.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/contract_entities/contract_entity.dart';
import '../../../repositories/contract_repositories/contract_repository.dart';
import 'get_contract_list_usecase.dart';

class GetContractListUsecaseImpl implements GetContractListUsecase {
  final ContractRepository repository;

  GetContractListUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<ContractEntity>>> call(
      NoParams noParams) async {
    return await repository.getContracts(noParams);
  }
}