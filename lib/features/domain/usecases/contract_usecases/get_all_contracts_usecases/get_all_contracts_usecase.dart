import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import '../../../entities/contract_entities/contract_entity.dart';
import '../../../entities/response_entities/response_entity.dart';

abstract class GetAllContractsUsecase implements Usecase<ResponseEntity<List<ContractEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<ContractEntity>>>> call(
      NoParams params);
}