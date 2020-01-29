// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Message on _MessageBase, Store {
  final _$titleAtom = Atom(name: '_MessageBase.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$idAtom = Atom(name: '_MessageBase.id');

  @override
  String get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$_MessageBaseActionController = ActionController(name: '_MessageBase');

  @override
  dynamic setTitle(String newTitle) {
    final _$actionInfo = _$_MessageBaseActionController.startAction();
    try {
      return super.setTitle(newTitle);
    } finally {
      _$_MessageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setId(String newId) {
    final _$actionInfo = _$_MessageBaseActionController.startAction();
    try {
      return super.setId(newId);
    } finally {
      _$_MessageBaseActionController.endAction(_$actionInfo);
    }
  }
}
