import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/company_usecases/get_all_companies_usecase/get_all_companies_usecase.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/company_repositories/company_repository.dart';

class GetAllCompaniesUsecaseImpl implements GetAllCompaniesUsecase {
  final CompanyRepository repository;

  GetAllCompaniesUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<CompanyEntity>>>> call(
      NoParams noParams) async {
    return await repository.getAllCompanies(noParams);
  }
}