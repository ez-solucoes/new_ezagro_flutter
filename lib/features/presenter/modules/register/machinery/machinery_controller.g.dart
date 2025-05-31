// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machinery_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MachineryController on MachineryControllerAbstract, Store {
  late final _$isLoadingAtom =
      Atom(name: 'MachineryControllerAbstract.isLoading', context: context);

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

  late final _$machineryImplementEntityAtom = Atom(
      name: 'MachineryControllerAbstract.machineryImplementEntity',
      context: context);

  @override
  MachineryImplementEntity get machineryImplementEntity {
    _$machineryImplementEntityAtom.reportRead();
    return super.machineryImplementEntity;
  }

  @override
  set machineryImplementEntity(MachineryImplementEntity value) {
    _$machineryImplementEntityAtom
        .reportWrite(value, super.machineryImplementEntity, () {
      super.machineryImplementEntity = value;
    });
  }

  late final _$machineryImplementListAtom = Atom(
      name: 'MachineryControllerAbstract.machineryImplementList',
      context: context);

  @override
  List<MachineryImplementEntity> get machineryImplementList {
    _$machineryImplementListAtom.reportRead();
    return super.machineryImplementList;
  }

  @override
  set machineryImplementList(List<MachineryImplementEntity> value) {
    _$machineryImplementListAtom
        .reportWrite(value, super.machineryImplementList, () {
      super.machineryImplementList = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'MachineryControllerAbstract.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$getAllMachineryImplementsAsyncAction = AsyncAction(
      'MachineryControllerAbstract.getAllMachineryImplements',
      context: context);

  @override
  Future<void> getAllMachineryImplements() {
    return _$getAllMachineryImplementsAsyncAction
        .run(() => super.getAllMachineryImplements());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
machineryImplementEntity: ${machineryImplementEntity},
machineryImplementList: ${machineryImplementList},
errorMessage: ${errorMessage}
    ''';
  }
}
