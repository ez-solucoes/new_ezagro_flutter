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

  late final _$getCompaniesListAsyncAction = AsyncAction(
      'CompanyControllerAbstract.getCompaniesList',
      context: context);

  @override
  Future<dynamic> getCompaniesList() {
    return _$getCompaniesListAsyncAction.run(() => super.getCompaniesList());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
companies: ${companies}
    ''';
  }
}
