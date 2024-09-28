// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceOrderListController on ServiceOrderListControllerAbstract, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ServiceOrderListController.isLoading', context: context);

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

  late final _$serviceOrderListEntitiesAtom = Atom(
      name: '_ServiceOrderListController.serviceOrderListEntities',
      context: context);

  @override
  List<ServiceOrderListEntity> get serviceOrderListEntities {
    _$serviceOrderListEntitiesAtom.reportRead();
    return super.serviceOrderListEntities;
  }

  @override
  set serviceOrderListEntities(List<ServiceOrderListEntity> value) {
    _$serviceOrderListEntitiesAtom
        .reportWrite(value, super.serviceOrderListEntities, () {
      super.serviceOrderListEntities = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: '_ServiceOrderListController.searchText', context: context);

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  late final _$filteredServiceOrdersAtom = Atom(
      name: '_ServiceOrderListController.filteredServiceOrders',
      context: context);

  @override
  List<ServiceOrderListEntity> get filteredServiceOrders {
    _$filteredServiceOrdersAtom.reportRead();
    return super.filteredServiceOrders;
  }

  @override
  set filteredServiceOrders(List<ServiceOrderListEntity> value) {
    _$filteredServiceOrdersAtom.reportWrite(value, super.filteredServiceOrders,
        () {
      super.filteredServiceOrders = value;
    });
  }

  late final _$getServiceOrderListAsyncAction = AsyncAction(
      '_ServiceOrderListController.getServiceOrderList',
      context: context);

  @override
  Future<dynamic> getServiceOrderList() {
    return _$getServiceOrderListAsyncAction
        .run(() => super.getServiceOrderList());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
serviceOrderListEntities: ${serviceOrderListEntities},
searchText: ${searchText},
filteredServiceOrders: ${filteredServiceOrders}
    ''';
  }
}
