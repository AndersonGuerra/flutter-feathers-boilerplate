import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:adhara_socket_io/manager.dart';

class Connector {
  SocketIOManager manager = SocketIOManager();
  static SocketIO socket;
  static var user;

  Connector() {
    manager.createInstance(SocketOptions(
      "http://10.0.2.2:3030/",
      transports: [Transports.WEB_SOCKET]
    )).then((socketResult){
      socket = socketResult;
      socket.onConnect((data) async {
        user = await socket.emitWithAck("create", ["authentication", {
          "strategy": "local",
          "email": "a@a.com",
          "password": "123@mudar"
        }]);
        socket.on("messages created", (message){
          print(message);
        });
        // print(user[0]);
        // var response = await socket.emitWithAck("find", ["messages"]);
        // List messageList = response[0];
        // messageList.forEach((message){
        //   messagesController.addMessage(Message(message["text"], message["_id"]));
        // });
      });
      socket.connect();
    });
  }

  static createMessage(String message) async {
    if (user != null) {
      socket.emitWithAck("create", ["messages", {"text": message}]).then((r){
        // print(r);
      }).catchError((onError){
        // print(onError);
      });
    }
  }

}