import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/product_repositories/product_type_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/product_types_usecases/get_all_product_types_to_select_usecases/get_all_product_types_to_select_usecase.dart';

class GetAllProductTypesToSelectUsecaseImpl implements GetAllProductTypesToSelectUsecase {

  final ProductTypeRepository repository;

  GetAllProductTypesToSelectUsecaseImpl(this.repository);


  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(NoParams noParams) async {
    return await repository.getAllProductTypesToSelect(noParams);
  }


}