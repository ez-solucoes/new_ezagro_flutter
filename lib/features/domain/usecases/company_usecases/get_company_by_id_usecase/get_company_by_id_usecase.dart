import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';

abstract class GetCompanyByIdUsecase implements Usecase<CompanyEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, CompanyEntity>> call(
      ArgParams argParams);
}