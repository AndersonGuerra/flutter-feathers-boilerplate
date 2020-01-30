import 'dart:async';

import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:adhara_socket_io/manager.dart';
import 'package:adhara_test/models/message.dart';
import 'package:adhara_test/store/messages.dart';
import 'package:flutter/material.dart';

class Connector {
  static SocketIOManager manager = SocketIOManager();
  static SocketIO socket;
  static ValueNotifier<Map<String, dynamic>> user = ValueNotifier({"accessToken": null});
  // static Map<String, dynamic> user = {"accessToken": null};

  Connector();

  static stablishInitialConnection(SocketIO socket, Messages messagesController){
    Connector.socket = socket;
    Connector.socket.onConnect((data) async {
      // print(socket.id);
      List<dynamic> userAux = await Connector.socket.emitWithAck("create", ["authentication", {
        "strategy": "local",
        "email": "a@a.com",
        "password": "123@mudar"
      }]);
      // Connector.user = userAux[0];
      Connector.user.value = userAux[0];
      // print(Connector.user["accessToken"]); // salvar no storage
      Connector.socket.emitWithAck("find", ["messages"]).then((response){
        List messageList = response[0];
        messageList.forEach((message){
          messagesController.addMessage(Message(message["text"], message["_id"]));
        });
      });
    });
    Connector.socket.connect();
    Connector.socket.on("messages created", (message){
      messagesController.addMessage(Message(message["text"], message["_id"]));
    });
  }

  static createMessage(String message) async {
    if (user != null) {
      socket.emitWithAck("create", ["messages", {"text": message}]).then((r){
        
      }).catchError((onError){
        
      });
    }
  }

}