// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_listed_items_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditListedItemsController on EditListedItemsPageAbstract, Store {
  late final _$isLoadingAtom =
      Atom(name: 'EditListedItemsPageAbstract.isLoading', context: context);

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

  late final _$autoCompleteListAtom = Atom(
      name: 'EditListedItemsPageAbstract.autoCompleteList', context: context);

  @override
  List<SelectEntity> get autoCompleteList {
    _$autoCompleteListAtom.reportRead();
    return super.autoCompleteList;
  }

  @override
  set autoCompleteList(List<SelectEntity> value) {
    _$autoCompleteListAtom.reportWrite(value, super.autoCompleteList, () {
      super.autoCompleteList = value;
    });
  }

  late final _$getAllCompaniesToSelectAsyncAction = AsyncAction(
      'EditListedItemsPageAbstract.getAllCompaniesToSelect',
      context: context);

  @override
  Future<void> getAllCompaniesToSelect() {
    return _$getAllCompaniesToSelectAsyncAction
        .run(() => super.getAllCompaniesToSelect());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
autoCompleteList: ${autoCompleteList}
    ''';
  }
}
