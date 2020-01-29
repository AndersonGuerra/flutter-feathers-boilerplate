import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:adhara_socket_io/manager.dart';

class Connector {
  static SocketIOManager manager = SocketIOManager();
  static SocketIO socket;
  static var user;

  Connector();

  static stablishConnection(){
    print("chamou o stablish");
    socket.connect();
    socket.onConnect((data) async {
      print("on connect");
      user = await socket.emitWithAck("create", ["authentication", {
        "strategy": "local",
        "email": "a@a.com",
        "password": "123@mudar"
      }]);
      print("conectado");
    });
  }

  static createMessage(String message) async {
    print("hum");
    print(user);
    if (user != null) {
      socket.emitWithAck("create", ["messages", {"text": message}]).then((r){
        // print(r);
      }).catchError((onError){
        // print(onError);
      });
    }
  }

}