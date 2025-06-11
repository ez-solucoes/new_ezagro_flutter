// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CompanyController on CompanyControllerAbstract, Store {
  late final _$isLoadingAtom =
      Atom(name: 'CompanyControllerAbstract.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$companiesAtom =
      Atom(name: 'CompanyControllerAbstract.companies', context: context);

  @override
  List<CompanyEntity> get companies {
    _$companiesAtom.reportRead();
    return super.companies;
  }

  @override
  set companies(List<CompanyEntity> value) {
    _$companiesAtom.reportWrite(value, super.companies, () {
      super.companies = value;
    });
  }

  late final _$filteredCompaniesAtom = Atom(
      name: 'CompanyControllerAbstract.filteredCompanies', context: context);

  @override
  List<CompanyEntity> get filteredCompanies {
    _$filteredCompaniesAtom.reportRead();
    return super.filteredCompanies;
  }

  @override
  set filteredCompanies(List<CompanyEntity> value) {
    _$filteredCompaniesAtom.reportWrite(value, super.filteredCompanies, () {
      super.filteredCompanies = value;
    });
  }

  late final _$companyAtom =
      Atom(name: 'CompanyControllerAbstract.company', context: context);

  @override
  CompanyEntity? get company {
    _$companyAtom.reportRead();
    return super.company;
  }

  @override
  set company(CompanyEntity? value) {
    _$companyAtom.reportWrite(value, super.company, () {
      super.company = value;
    });
  }

  late final _$getCompaniesListAsyncAction = AsyncAction(
      'CompanyControllerAbstract.getCompaniesList',
      context: context);

  @override
  Future<dynamic> getCompaniesList() {
    return _$getCompaniesListAsyncAction.run(() => super.getCompaniesList());
  }

  late final _$getCompanyByIdAsyncAction =
      AsyncAction('CompanyControllerAbstract.getCompanyById', context: context);

  @override
  Future<dynamic> getCompanyById(ArgParams args) {
    return _$getCompanyByIdAsyncAction.run(() => super.getCompanyById(args));
  }

  late final _$CompanyControllerAbstractActionController =
      ActionController(name: 'CompanyControllerAbstract', context: context);

  @override
  void searchCompany(String searchText) {
    final _$actionInfo = _$CompanyControllerAbstractActionController
        .startAction(name: 'CompanyControllerAbstract.searchCompany');
    try {
      return super.searchCompany(searchText);
    } finally {
      _$CompanyControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
companies: ${companies},
filteredCompanies: ${filteredCompanies},
company: ${company}
    ''';
  }
}
