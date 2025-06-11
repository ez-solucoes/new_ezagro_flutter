import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/response_entities/response_entity.dart';

abstract class GetCompanyByIdUsecase implements Usecase<ResponseEntity<CompanyEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<CompanyEntity>>> call(
      ArgParams argParams);
}