import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/company_usecases/get_company_by_id_usecase/get_company_by_id_usecase.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../repositories/company_repositories/company_repository.dart';

class GetCompanyByIdUsecaseImpl implements GetCompanyByIdUsecase {

  final CompanyRepository repository;

  GetCompanyByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, CompanyEntity>> call(
      ArgParams argParams) async {
    return await repository.getCompanyById(argParams);
  }
}