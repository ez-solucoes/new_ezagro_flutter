import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import '../../../../core/usecase/usecase.dart';

abstract class CompanyRepository {
  Future<Either<ApplicationError, List<CompanyEntity>>>
  getAllCompanies(NoParams noParams);

  Future<Either<ApplicationError, CompanyEntity>> getCompanyById(ArgParams argParams);
}
