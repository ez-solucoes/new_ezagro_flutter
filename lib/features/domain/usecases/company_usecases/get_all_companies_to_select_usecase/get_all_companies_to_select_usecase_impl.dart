import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/company_usecases/get_all_companies_to_select_usecase/get_all_companies_to_select_usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/select_entities/select_entity.dart';
import '../../../repositories/company_repositories/company_repository.dart';

class GetAllCompaniesToSelectUsecaseImpl implements GetAllCompaniesToSelectUsecase {
  final CompanyRepository repository;

  GetAllCompaniesToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(NoParams params) async {
    return await repository.getAllCompaniesToSelect(params);
  }
}