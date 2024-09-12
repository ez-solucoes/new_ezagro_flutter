// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_service_order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateServiceOrderController on _CreateServiceOrderController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CreateServiceOrderController.isLoading', context: context);

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

  late final _$pageAtom =
      Atom(name: '_CreateServiceOrderController.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$selectAllAtom =
      Atom(name: '_CreateServiceOrderController.selectAll', context: context);

  @override
  bool get selectAll {
    _$selectAllAtom.reportRead();
    return super.selectAll;
  }

  @override
  set selectAll(bool value) {
    _$selectAllAtom.reportWrite(value, super.selectAll, () {
      super.selectAll = value;
    });
  }

  late final _$executionersAtom = Atom(
      name: '_CreateServiceOrderController.executioners', context: context);

  @override
  List<String> get executioners {
    _$executionersAtom.reportRead();
    return super.executioners;
  }

  @override
  set executioners(List<String> value) {
    _$executionersAtom.reportWrite(value, super.executioners, () {
      super.executioners = value;
    });
  }

  late final _$machineryAtom =
      Atom(name: '_CreateServiceOrderController.machinery', context: context);

  @override
  List<String> get machinery {
    _$machineryAtom.reportRead();
    return super.machinery;
  }

  @override
  set machinery(List<String> value) {
    _$machineryAtom.reportWrite(value, super.machinery, () {
      super.machinery = value;
    });
  }

  late final _$_CreateServiceOrderControllerActionController =
      ActionController(name: '_CreateServiceOrderController', context: context);

  @override
  dynamic toggleSelectAll() {
    final _$actionInfo = _$_CreateServiceOrderControllerActionController
        .startAction(name: '_CreateServiceOrderController.toggleSelectAll');
    try {
      return super.toggleSelectAll();
    } finally {
      _$_CreateServiceOrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementPage() {
    final _$actionInfo = _$_CreateServiceOrderControllerActionController
        .startAction(name: '_CreateServiceOrderController.incrementPage');
    try {
      return super.incrementPage();
    } finally {
      _$_CreateServiceOrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrementPage() {
    final _$actionInfo = _$_CreateServiceOrderControllerActionController
        .startAction(name: '_CreateServiceOrderController.decrementPage');
    try {
      return super.decrementPage();
    } finally {
      _$_CreateServiceOrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
page: ${page},
selectAll: ${selectAll},
executioners: ${executioners},
machinery: ${machinery}
    ''';
  }
}
