import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/data/models/company_models/company_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import '../../../../core/errors/application_error.dart';
import '../../../../core/errors/generic_error.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../domain/repositories/company_repositories/company_repository.dart';
import '../../datasources/remote_datasource/company_datasources/company_datasource.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyDatasource datasource;

  CompanyRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<List<CompanyModel>>>>
  getAllCompanies(NoParams noParams) async {
    try {
      final result = await datasource.getAllCompanies(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CompanyRepositoryImpl.getAllCompanies',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<CompanyModel>>>
  getCompanyById(ArgParams argParams) async {
    try {
      final result = await datasource.getCompanyById(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CompanyRepositoryImpl.getCompanyById',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<List<SelectModel>>>>
  getAllCompaniesToSelect(NoParams noParams) async {
    try {
      final result = await datasource.getAllCompaniesToSelect(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CompanyRepositoryImpl.getAllCompanies',
          additionalInfo: stacktrace.toString()));
    }
  }
}
