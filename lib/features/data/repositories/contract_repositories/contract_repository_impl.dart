import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import '../../../domain/params/arg_params/arg_params.dart';
import '../../../domain/repositories/contract_repositories/contract_repository.dart';
import '../../datasources/remote_datasource/contract_datasources/contract_datasource.dart';
import '../../models/contract_models/contract_model.dart';

class ContractRepositoryImpl implements ContractRepository {
  final ContractDatasource datasource;

  ContractRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<ContractModel>>>> getAllContracts(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllContracts(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ContractRepositoryImpl.getContracts',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<ContractModel>>> getContractById(
      ArgParams argParams) async {
    try {
      final result = await datasource.getContractById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ContractRepositoryImpl.getContractById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>>
      getAllContractsToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllContractsToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ContractRepositoryImpl.getAllContractsToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }
}
