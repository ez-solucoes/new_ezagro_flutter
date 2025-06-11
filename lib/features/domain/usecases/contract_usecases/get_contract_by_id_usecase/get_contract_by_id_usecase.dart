import 'package:dartz/dartz.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/contract_entities/contract_entity.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class GetContractByIdUsecase implements Usecase<ResponseEntity<ContractEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<ContractEntity>>> call(
      ArgParams argParams);
}