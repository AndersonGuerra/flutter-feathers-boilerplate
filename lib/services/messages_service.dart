import 'package:adhara_test/models/message.dart';
import 'package:adhara_test/store/messages.dart';
import 'package:adhara_test/utils/socket.dart';

class MessagesService {

  static setConfigs(Messages messagesController) {
    _seedMessages(messagesController);
    _onCreated(messagesController);
  }

  static _onCreated(Messages messagesController){
    Connector.socket.on("messages created", (message){
      messagesController.addMessage(Message(message["text"], message["_id"]));
    });
  }

  static _seedMessages(Messages messagesController) {
    Connector.socket.emitWithAck("find", ["messages"]).then((response){
      List messageList = response[0];
      messagesController.clearMessages();
      messageList.forEach((message){
        messagesController.addMessage(Message(message["text"], message["_id"]));
      });
    });
  }

  static createMessage(String message) async {
    if (Connector.user.value["accessToken"] != null) {
      await Connector.socket.emitWithAck("create", ["messages", {"text": message}]).then((r){
        
      }).catchError((onError){
        
      });
    }
  }
}