import 'package:dartz/dartz.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/contract_entities/contract_entity.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/contract_repositories/contract_repository.dart';
import 'get_all_contracts_usecase.dart';


class GetAllContractsUsecaseImpl implements GetAllContractsUsecase {
  final ContractRepository repository;

  GetAllContractsUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<ContractEntity>>>> call(
      NoParams noParams) async {
    return await repository.getAllContracts(noParams);
  }
}