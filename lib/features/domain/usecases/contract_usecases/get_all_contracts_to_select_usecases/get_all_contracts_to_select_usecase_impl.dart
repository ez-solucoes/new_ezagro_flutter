import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/contract_repositories/contract_repository.dart';

import 'get_all_contracts_to_select_usecase.dart';

class GetAllContractsToSelectUsecaseImpl with UriBuilder implements GetAllContractsToSelectUsecase {
  final ContractRepository repository;

  const GetAllContractsToSelectUsecaseImpl(this.repository);
  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(NoParams noParams) async {
    return await repository.getAllContractsToSelect(noParams);
  }
}