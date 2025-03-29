// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approvals_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApprovalsListController on ApprovalsListControllerAbstract, Store {
  late final _$isLoadingAtom =
      Atom(name: 'ApprovalsListControllerAbstract.isLoading', context: context);

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

  late final _$pageIndexAtom =
      Atom(name: 'ApprovalsListControllerAbstract.pageIndex', context: context);

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  late final _$serviceOrderListEntitiesAtom = Atom(
      name: 'ApprovalsListControllerAbstract.serviceOrderListEntities',
      context: context);

  @override
  List<ServiceOrderEntity> get serviceOrderListEntities {
    _$serviceOrderListEntitiesAtom.reportRead();
    return super.serviceOrderListEntities;
  }

  @override
  set serviceOrderListEntities(List<ServiceOrderEntity> value) {
    _$serviceOrderListEntitiesAtom
        .reportWrite(value, super.serviceOrderListEntities, () {
      super.serviceOrderListEntities = value;
    });
  }

  late final _$purchaseRequestListEntitiesAtom = Atom(
      name: 'ApprovalsListControllerAbstract.purchaseRequestListEntities',
      context: context);

  @override
  List<PurchaseRequestEntity> get purchaseRequestListEntities {
    _$purchaseRequestListEntitiesAtom.reportRead();
    return super.purchaseRequestListEntities;
  }

  @override
  set purchaseRequestListEntities(List<PurchaseRequestEntity> value) {
    _$purchaseRequestListEntitiesAtom
        .reportWrite(value, super.purchaseRequestListEntities, () {
      super.purchaseRequestListEntities = value;
    });
  }

  late final _$isCheckedAtom =
      Atom(name: 'ApprovalsListControllerAbstract.isChecked', context: context);

  @override
  bool get isChecked {
    _$isCheckedAtom.reportRead();
    return super.isChecked;
  }

  @override
  set isChecked(bool value) {
    _$isCheckedAtom.reportWrite(value, super.isChecked, () {
      super.isChecked = value;
    });
  }

  late final _$checkboxStatesAtom = Atom(
      name: 'ApprovalsListControllerAbstract.checkboxStates', context: context);

  @override
  List<bool> get checkboxStates {
    _$checkboxStatesAtom.reportRead();
    return super.checkboxStates;
  }

  @override
  set checkboxStates(List<bool> value) {
    _$checkboxStatesAtom.reportWrite(value, super.checkboxStates, () {
      super.checkboxStates = value;
    });
  }

  late final _$getServiceOrderByStatusIdAsyncAction = AsyncAction(
      'ApprovalsListControllerAbstract.getServiceOrderByStatusId',
      context: context);

  @override
  Future<void> getServiceOrderByStatusId(String serviceOrderStatusId) {
    return _$getServiceOrderByStatusIdAsyncAction
        .run(() => super.getServiceOrderByStatusId(serviceOrderStatusId));
  }

  late final _$getPurchaseRequestByStatusIdAsyncAction = AsyncAction(
      'ApprovalsListControllerAbstract.getPurchaseRequestByStatusId',
      context: context);

  @override
  Future<void> getPurchaseRequestByStatusId(String purchaseRequestStatusId) {
    return _$getPurchaseRequestByStatusIdAsyncAction
        .run(() => super.getPurchaseRequestByStatusId(purchaseRequestStatusId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
pageIndex: ${pageIndex},
serviceOrderListEntities: ${serviceOrderListEntities},
purchaseRequestListEntities: ${purchaseRequestListEntities},
isChecked: ${isChecked},
checkboxStates: ${checkboxStates}
    ''';
  }
}
