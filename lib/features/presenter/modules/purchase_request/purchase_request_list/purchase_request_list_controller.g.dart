// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_request_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurchaseRequestListController
    on PurchaseRequestListControllerAbstract, Store {
  late final _$isLoadingAtom = Atom(
      name: 'PurchaseRequestListControllerAbstract.isLoading',
      context: context);

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

  late final _$isUrgentAtom = Atom(
      name: 'PurchaseRequestListControllerAbstract.isUrgent', context: context);

  @override
  bool get isUrgent {
    _$isUrgentAtom.reportRead();
    return super.isUrgent;
  }

  @override
  set isUrgent(bool value) {
    _$isUrgentAtom.reportWrite(value, super.isUrgent, () {
      super.isUrgent = value;
    });
  }

  late final _$hasErrorInQuotationItemAtom = Atom(
      name: 'PurchaseRequestListControllerAbstract.hasErrorInQuotationItem',
      context: context);

  @override
  bool get hasErrorInQuotationItem {
    _$hasErrorInQuotationItemAtom.reportRead();
    return super.hasErrorInQuotationItem;
  }

  @override
  set hasErrorInQuotationItem(bool value) {
    _$hasErrorInQuotationItemAtom
        .reportWrite(value, super.hasErrorInQuotationItem, () {
      super.hasErrorInQuotationItem = value;
    });
  }

  late final _$purchaseRequestListEntitiesAtom = Atom(
      name: 'PurchaseRequestListControllerAbstract.purchaseRequestListEntities',
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

  late final _$startDismissibleAtom = Atom(
      name: 'PurchaseRequestListControllerAbstract.startDismissible',
      context: context);

  @override
  bool get startDismissible {
    _$startDismissibleAtom.reportRead();
    return super.startDismissible;
  }

  @override
  set startDismissible(bool value) {
    _$startDismissibleAtom.reportWrite(value, super.startDismissible, () {
      super.startDismissible = value;
    });
  }

  late final _$getAllPurchaseRequestsAsyncAction = AsyncAction(
      'PurchaseRequestListControllerAbstract.getAllPurchaseRequests',
      context: context);

  @override
  Future<void> getAllPurchaseRequests() {
    return _$getAllPurchaseRequestsAsyncAction
        .run(() => super.getAllPurchaseRequests());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isUrgent: ${isUrgent},
hasErrorInQuotationItem: ${hasErrorInQuotationItem},
purchaseRequestListEntities: ${purchaseRequestListEntities},
startDismissible: ${startDismissible}
    ''';
  }
}
