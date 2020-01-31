// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Messages on MessagesBase, Store {
  final _$messagesAtom = Atom(name: 'MessagesBase.messages');

  @override
  ObservableList<Message> get messages {
    _$messagesAtom.context.enforceReadPolicy(_$messagesAtom);
    _$messagesAtom.reportObserved();
    return super.messages;
  }

  @override
  set messages(ObservableList<Message> value) {
    _$messagesAtom.context.conditionallyRunInAction(() {
      super.messages = value;
      _$messagesAtom.reportChanged();
    }, _$messagesAtom, name: '${_$messagesAtom.name}_set');
  }

  final _$MessagesBaseActionController = ActionController(name: 'MessagesBase');

  @override
  dynamic addMessage(Message message) {
    final _$actionInfo = _$MessagesBaseActionController.startAction();
    try {
      return super.addMessage(message);
    } finally {
      _$MessagesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeMessage(Message message) {
    final _$actionInfo = _$MessagesBaseActionController.startAction();
    try {
      return super.removeMessage(message);
    } finally {
      _$MessagesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearMessages() {
    final _$actionInfo = _$MessagesBaseActionController.startAction();
    try {
      return super.clearMessages();
    } finally {
      _$MessagesBaseActionController.endAction(_$actionInfo);
    }
  }
}
