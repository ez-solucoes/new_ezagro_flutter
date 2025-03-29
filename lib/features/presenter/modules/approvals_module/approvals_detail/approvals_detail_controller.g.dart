// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approvals_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ApprovalsDetailController on ApprovalsDetailControllerAbstract, Store {
  late final _$isLoadingAtom = Atom(
      name: 'ApprovalsDetailControllerAbstract.isLoading', context: context);

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

  late final _$isExpandedAtom = Atom(
      name: 'ApprovalsDetailControllerAbstract.isExpanded', context: context);

  @override
  bool get isExpanded {
    _$isExpandedAtom.reportRead();
    return super.isExpanded;
  }

  @override
  set isExpanded(bool value) {
    _$isExpandedAtom.reportWrite(value, super.isExpanded, () {
      super.isExpanded = value;
    });
  }

  late final _$purchaseRequestAtom = Atom(
      name: 'ApprovalsDetailControllerAbstract.purchaseRequest',
      context: context);

  @override
  PurchaseRequestEntity? get purchaseRequest {
    _$purchaseRequestAtom.reportRead();
    return super.purchaseRequest;
  }

  @override
  set purchaseRequest(PurchaseRequestEntity? value) {
    _$purchaseRequestAtom.reportWrite(value, super.purchaseRequest, () {
      super.purchaseRequest = value;
    });
  }

  late final _$serviceOrderAtom = Atom(
      name: 'ApprovalsDetailControllerAbstract.serviceOrder', context: context);

  @override
  ServiceOrderEntity? get serviceOrder {
    _$serviceOrderAtom.reportRead();
    return super.serviceOrder;
  }

  @override
  set serviceOrder(ServiceOrderEntity? value) {
    _$serviceOrderAtom.reportWrite(value, super.serviceOrder, () {
      super.serviceOrder = value;
    });
  }

  late final _$getPurchaseRequestByIdAsyncAction = AsyncAction(
      'ApprovalsDetailControllerAbstract.getPurchaseRequestById',
      context: context);

  @override
  Future<dynamic> getPurchaseRequestById(int purchaseRequestId) {
    return _$getPurchaseRequestByIdAsyncAction
        .run(() => super.getPurchaseRequestById(purchaseRequestId));
  }

  late final _$approvePurchaseRequestByIdAsyncAction = AsyncAction(
      'ApprovalsDetailControllerAbstract.approvePurchaseRequestById',
      context: context);

  @override
  Future<dynamic> approvePurchaseRequestById(int purchaseRequestId) {
    return _$approvePurchaseRequestByIdAsyncAction
        .run(() => super.approvePurchaseRequestById(purchaseRequestId));
  }

  late final _$cancelPurchaseRequestByIdAsyncAction = AsyncAction(
      'ApprovalsDetailControllerAbstract.cancelPurchaseRequestById',
      context: context);

  @override
  Future<dynamic> cancelPurchaseRequestById(int purchaseRequestId) {
    return _$cancelPurchaseRequestByIdAsyncAction
        .run(() => super.cancelPurchaseRequestById(purchaseRequestId));
  }

  late final _$getServiceOrderByIdAsyncAction = AsyncAction(
      'ApprovalsDetailControllerAbstract.getServiceOrderById',
      context: context);

  @override
  Future<dynamic> getServiceOrderById(int id) {
    return _$getServiceOrderByIdAsyncAction
        .run(() => super.getServiceOrderById(id));
  }

  late final _$approveServiceOrderByIdAsyncAction = AsyncAction(
      'ApprovalsDetailControllerAbstract.approveServiceOrderById',
      context: context);

  @override
  Future<dynamic> approveServiceOrderById(int id) {
    return _$approveServiceOrderByIdAsyncAction
        .run(() => super.approveServiceOrderById(id));
  }

  late final _$cancelServiceOrderByIdAsyncAction = AsyncAction(
      'ApprovalsDetailControllerAbstract.cancelServiceOrderById',
      context: context);

  @override
  Future<dynamic> cancelServiceOrderById(int id) {
    return _$cancelServiceOrderByIdAsyncAction
        .run(() => super.cancelServiceOrderById(id));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isExpanded: ${isExpanded},
purchaseRequest: ${purchaseRequest},
serviceOrder: ${serviceOrder}
    ''';
  }
}
