import 'package:adhara_test/models/message.dart';
import 'package:mobx/mobx.dart';
part 'messages.g.dart';

class Messages = MessagesBase with _$Messages;

abstract class MessagesBase with Store {
  @observable
  ObservableList<Message> messages = ObservableList();

  @action
  addMessage(Message message) {
    messages.add(message);
  }

  @action
  removeMessage(Message message) {
    messages.removeWhere((msg)=>msg.id == message.id);
  }

  dispose(){}
}