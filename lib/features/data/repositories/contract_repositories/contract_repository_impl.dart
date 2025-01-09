import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import '../../../domain/params/arg_params/arg_params.dart';
import '../../../domain/repositories/contract_repositories/contract_repository.dart';
import '../../datasources/remote_datasource/contract_datasources/contract_datasource.dart';
import '../../models/contract_models/contract_model.dart';

class ContractRepositoryImpl implements ContractRepository {
  final ContractDatasource datasource;

  ContractRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, List<ContractModel>>> getContracts(
      NoParams noParams) async {
    try {
      final result = await datasource.getContracts(noParams);
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
  Future<Either<ApplicationError, ContractModel>>
  getContractById(ArgParams argParams) async {
    try {
      final result = await datasource.getContractById(argParams);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ContractRepositoryImpl.getContractById',
          additionalInfo: stacktrace.toString()));
    }
  }
}
