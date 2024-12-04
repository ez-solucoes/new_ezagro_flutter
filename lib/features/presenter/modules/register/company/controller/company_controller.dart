import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/company_usecases/get_all_companies_usecase/get_all_companies_usecase.dart';

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
  searchCompany(String searchText) {
    filteredCompanies = companies.where((e) =>
    (e.name?.toLowerCase() ?? "").contains(searchText.toLowerCase()) ||
        (e.legalDocumentNumber?.toLowerCase() ?? "").contains(searchText.toLowerCase())
    ).toList();
  }

}
