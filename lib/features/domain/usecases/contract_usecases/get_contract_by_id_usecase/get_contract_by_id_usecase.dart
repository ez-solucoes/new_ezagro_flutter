import 'package:dartz/dartz.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/contract_entities/contract_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class GetContractByIdUsecase implements Usecase<ContractEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, ContractEntity>> call(
      ArgParams argParams);
}