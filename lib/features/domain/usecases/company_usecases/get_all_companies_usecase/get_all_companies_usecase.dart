import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/response_entities/response_entity.dart';

abstract class GetAllCompaniesUsecase implements Usecase<ResponseEntity<List<CompanyEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<CompanyEntity>>>> call(
      NoParams params);
}