import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import '../../../../core/errors/application_error.dart';
import '../../../../core/usecase/usecase.dart';
import '../../entities/contract_entities/contract_entity.dart';
import '../../params/arg_params/arg_params.dart';

abstract class ContractRepository {
  Future<Either<ApplicationError, ResponseEntity<List<ContractEntity>>>> getAllContracts(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<ContractEntity>>> getContractById(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> getAllContractsToSelect(NoParams noParams);

}
