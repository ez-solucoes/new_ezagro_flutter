// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceOrderController on ServiceOrderControllerAbstract, Store {
  late final _$isLoadingAtom =
      Atom(name: 'ServiceOrderControllerAbstract.isLoading', context: context);

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

  late final _$serviceOrderAtom = Atom(
      name: 'ServiceOrderControllerAbstract.serviceOrder', context: context);

  @override
  FieldServiceOrderEntity? get serviceOrder {
    _$serviceOrderAtom.reportRead();
    return super.serviceOrder;
  }

  @override
  set serviceOrder(FieldServiceOrderEntity? value) {
    _$serviceOrderAtom.reportWrite(value, super.serviceOrder, () {
      super.serviceOrder = value;
    });
  }

  late final _$getServiceOrderAsyncAction = AsyncAction(
      'ServiceOrderControllerAbstract.getServiceOrder',
      context: context);

  @override
  Future<dynamic> getServiceOrder() {
    return _$getServiceOrderAsyncAction.run(() => super.getServiceOrder());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
serviceOrder: ${serviceOrder}
    ''';
  }
}
