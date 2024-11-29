import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/data/models/company_models/company_model.dart';
import '../../../../core/errors/application_error.dart';
import '../../../../core/errors/generic_error.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../domain/repositories/company_repositories/company_repository.dart';
import '../../datasources/remote_datasource/company_datasources/company_datasource.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyDatasource datasource;

  CompanyRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, List<CompanyModel>>>
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
}
