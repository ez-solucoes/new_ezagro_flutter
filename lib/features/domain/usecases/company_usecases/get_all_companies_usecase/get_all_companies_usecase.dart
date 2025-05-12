import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';

abstract class GetAllCompaniesUsecase implements Usecase<List<CompanyEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<CompanyEntity>>> call(
      NoParams params);
}