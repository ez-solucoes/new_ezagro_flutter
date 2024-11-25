// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plots_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlotsListController on PlotsListControllerAbstract, Store {
  late final _$filterOptionsAtom =
      Atom(name: 'PlotsListControllerAbstract.filterOptions', context: context);

  @override
  List<(String, bool)> get filterOptions {
    _$filterOptionsAtom.reportRead();
    return super.filterOptions;
  }

  @override
  set filterOptions(List<(String, bool)> value) {
    _$filterOptionsAtom.reportWrite(value, super.filterOptions, () {
      super.filterOptions = value;
    });
  }

  late final _$plotsAtom =
      Atom(name: 'PlotsListControllerAbstract.plots', context: context);

  @override
  List<PlotEntity> get plots {
    _$plotsAtom.reportRead();
    return super.plots;
  }

  @override
  set plots(List<PlotEntity> value) {
    _$plotsAtom.reportWrite(value, super.plots, () {
      super.plots = value;
    });
  }

  late final _$PlotsListControllerAbstractActionController =
      ActionController(name: 'PlotsListControllerAbstract', context: context);

  @override
  dynamic applyFilter() {
    final _$actionInfo = _$PlotsListControllerAbstractActionController
        .startAction(name: 'PlotsListControllerAbstract.applyFilter');
    try {
      return super.applyFilter();
    } finally {
      _$PlotsListControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cleanFilter() {
    final _$actionInfo = _$PlotsListControllerAbstractActionController
        .startAction(name: 'PlotsListControllerAbstract.cleanFilter');
    try {
      return super.cleanFilter();
    } finally {
      _$PlotsListControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filterOptions: ${filterOptions},
plots: ${plots}
    ''';
  }
}
