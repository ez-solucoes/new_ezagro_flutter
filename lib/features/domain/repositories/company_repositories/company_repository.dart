import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import '../../../../core/usecase/usecase.dart';

abstract class CompanyRepository {
  Future<Either<ApplicationError, ResponseEntity<List<CompanyEntity>>>>
  getAllCompanies(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<CompanyEntity>>> getCompanyById(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
  getAllCompaniesToSelect(NoParams noParams);
}
