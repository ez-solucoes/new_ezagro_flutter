import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import '../../../entities/contract_entities/contract_entity.dart';

abstract class GetContractListUsecase implements Usecase<List<ContractEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<ContractEntity>>> call(
      NoParams params);
}