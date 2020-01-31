import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:adhara_socket_io/manager.dart';
import 'package:adhara_test/services/auth.dart';
import 'package:adhara_test/services/messages_service.dart';
import 'package:adhara_test/store/messages.dart';
import 'package:flutter/material.dart';

class Connector {
  static SocketIOManager manager = SocketIOManager();
  static SocketIO socket;
  static ValueNotifier<Map<String, dynamic>> user = ValueNotifier({"accessToken": null});

  static stablishInitialConnection(SocketIO socket, Messages messagesController){
    Connector.socket = socket;
    Connector.socket.onConnect((data) async {
      await Auth.login(isJwt: true);
      MessagesService.setConfigs(messagesController);
    });
    Connector.socket.onReconnecting((listener) async {
      await Auth.login(isJwt: true);
      print("tentando reconectar");
      print(listener);
    });
    Connector.socket.onReconnectError((listener){
      print("reconect error");
      print(listener);
    });
    Connector.socket.onReconnectFailed((listener){
      print("reconect failed");
      print(listener);
    });
    Connector.socket.onDisconnect((_) async {
    });
    Connector.socket.connect();
  }
  
}