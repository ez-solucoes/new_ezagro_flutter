// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_request_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurchaseRequestDetailController
    on PurchaseRequestDetailControllerAbstract, Store {
  late final _$isLoadingAtom = Atom(
      name: 'PurchaseRequestDetailControllerAbstract.isLoading',
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

  late final _$purchaseRequestEntityAtom = Atom(
      name: 'PurchaseRequestDetailControllerAbstract.purchaseRequestEntity',
      context: context);

  @override
  PurchaseRequestEntity? get purchaseRequestEntity {
    _$purchaseRequestEntityAtom.reportRead();
    return super.purchaseRequestEntity;
  }

  @override
  set purchaseRequestEntity(PurchaseRequestEntity? value) {
    _$purchaseRequestEntityAtom.reportWrite(value, super.purchaseRequestEntity,
        () {
      super.purchaseRequestEntity = value;
    });
  }

  late final _$getPurchaseRequestByIdAsyncAction = AsyncAction(
      'PurchaseRequestDetailControllerAbstract.getPurchaseRequestById',
      context: context);

  @override
  Future<void> getPurchaseRequestById(int id) {
    return _$getPurchaseRequestByIdAsyncAction
        .run(() => super.getPurchaseRequestById(id));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
purchaseRequestEntity: ${purchaseRequestEntity}
    ''';
  }
}
