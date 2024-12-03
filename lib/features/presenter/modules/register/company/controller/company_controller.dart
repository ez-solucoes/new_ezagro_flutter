import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/segment_entities/segment_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/company_usecases/get_all_companies_usecase/get_all_companies_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/company_usecases/get_company_by_id_usecase/get_company_by_id_usecase.dart';

import '../../../../../../core/usecase/usecase.dart';
part 'company_controller.g.dart';

class CompanyController = CompanyControllerAbstract with _$CompanyController;

abstract class CompanyControllerAbstract with Store {


  @observable
  bool isLoading = false;

  @observable
  List<CompanyEntity> companies = ObservableList();

  @observable
  List<CompanyEntity> filteredCompanies = ObservableList();

  @observable
  CompanyEntity? company;

  @action
  Future getCompaniesList() async {
    isLoading = true;
    final getCompanies = Modular.get<GetAllCompaniesUsecase>();
    final result = await getCompanies(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      companies = success;
      filteredCompanies = companies;
      return success;
    });

    isLoading = false;
  }

  @action
  Future getCompanyById(ArgParams args) async {
    isLoading = true;
    final getCompany = Modular.get<GetCompanyByIdUsecase>();
    final result = await getCompany(args);
    result.fold((error) => error.friendlyMessage, (success) {
      company = success;
      return success;
    });

    isLoading = false;
  }

  @action
  searchCompany(String searchText) {
    filteredCompanies = companies.where((e) =>
    (e.name?.toLowerCase() ?? "").contains(searchText.toLowerCase()) ||
        (e.legalDocumentNumber?.toLowerCase() ?? "").contains(searchText.toLowerCase())
    ).toList();
  }

}
