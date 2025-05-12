// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerAbstract, Store {
  late final _$totalPurchasesAtom =
      Atom(name: 'HomeControllerAbstract.totalPurchases', context: context);

  @override
  int get totalPurchases {
    _$totalPurchasesAtom.reportRead();
    return super.totalPurchases;
  }

  @override
  set totalPurchases(int value) {
    _$totalPurchasesAtom.reportWrite(value, super.totalPurchases, () {
      super.totalPurchases = value;
    });
  }

  late final _$totalApprovalsAtom =
      Atom(name: 'HomeControllerAbstract.totalApprovals', context: context);

  @override
  int get totalApprovals {
    _$totalApprovalsAtom.reportRead();
    return super.totalApprovals;
  }

  @override
  set totalApprovals(int value) {
    _$totalApprovalsAtom.reportWrite(value, super.totalApprovals, () {
      super.totalApprovals = value;
    });
  }

  late final _$totalUrgentPurchasesAtom = Atom(
      name: 'HomeControllerAbstract.totalUrgentPurchases', context: context);

  @override
  int get totalUrgentPurchases {
    _$totalUrgentPurchasesAtom.reportRead();
    return super.totalUrgentPurchases;
  }

  @override
  set totalUrgentPurchases(int value) {
    _$totalUrgentPurchasesAtom.reportWrite(value, super.totalUrgentPurchases,
        () {
      super.totalUrgentPurchases = value;
    });
  }

  late final _$totalServiceOrdersAtom =
      Atom(name: 'HomeControllerAbstract.totalServiceOrders', context: context);

  @override
  int get totalServiceOrders {
    _$totalServiceOrdersAtom.reportRead();
    return super.totalServiceOrders;
  }

  @override
  set totalServiceOrders(int value) {
    _$totalServiceOrdersAtom.reportWrite(value, super.totalServiceOrders, () {
      super.totalServiceOrders = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeControllerAbstract.isLoading', context: context);

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

  late final _$clientNameAtom =
      Atom(name: 'HomeControllerAbstract.clientName', context: context);

  @override
  String get clientName {
    _$clientNameAtom.reportRead();
    return super.clientName;
  }

  @override
  set clientName(String value) {
    _$clientNameAtom.reportWrite(value, super.clientName, () {
      super.clientName = value;
    });
  }

  late final _$getClientNameAsyncAction =
      AsyncAction('HomeControllerAbstract.getClientName', context: context);

  @override
  Future<void> getClientName() {
    return _$getClientNameAsyncAction.run(() => super.getClientName());
  }

  late final _$getPurchasesByStatusIdAsyncAction = AsyncAction(
      'HomeControllerAbstract.getPurchasesByStatusId',
      context: context);

  @override
  Future<void> getPurchasesByStatusId(int purchaseStatusId) {
    return _$getPurchasesByStatusIdAsyncAction
        .run(() => super.getPurchasesByStatusId(purchaseStatusId));
  }

  late final _$getServiceOrdersByStatusIdAsyncAction = AsyncAction(
      'HomeControllerAbstract.getServiceOrdersByStatusId',
      context: context);

  @override
  Future<void> getServiceOrdersByStatusId(int serviceOrderStatusId) {
    return _$getServiceOrdersByStatusIdAsyncAction
        .run(() => super.getServiceOrdersByStatusId(serviceOrderStatusId));
  }

  late final _$HomeControllerAbstractActionController =
      ActionController(name: 'HomeControllerAbstract', context: context);

  @override
  int calculateApprovals(int totalPurchases, int totalServiceOrders) {
    final _$actionInfo = _$HomeControllerAbstractActionController.startAction(
        name: 'HomeControllerAbstract.calculateApprovals');
    try {
      return super.calculateApprovals(totalPurchases, totalServiceOrders);
    } finally {
      _$HomeControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalPurchases: ${totalPurchases},
totalApprovals: ${totalApprovals},
totalUrgentPurchases: ${totalUrgentPurchases},
totalServiceOrders: ${totalServiceOrders},
isLoading: ${isLoading},
clientName: ${clientName}
    ''';
  }
}
