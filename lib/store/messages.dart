import 'package:adhara_test/models/message.dart';
import 'package:mobx/mobx.dart';
part 'messages.g.dart';

class Messages = MessagesBase with _$Messages;

abstract class MessagesBase with Store {
  @observable
  List<Message> messages = [];

  @action
  addMessage(Message message) {
    messages.add(message);
  }
}