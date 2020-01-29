import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:adhara_socket_io/manager.dart';
import 'package:adhara_socket_io/socket.dart';
import 'package:adhara_test/store/messages.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final messagesController = Messages();
  List<String> messages = [];
  SocketIOManager manager = SocketIOManager();
  SocketIO socket;
  var user;

  @override
  void initState() {
    super.initState();
    manager.createInstance(SocketOptions(
      "http://10.0.2.2:3030/",
      transports: [Transports.WEB_SOCKET]
    )).then((socketResult){
      socket = socketResult;
      socket.onConnect((data) async {
        print("conectou");
        user = await socket.emitWithAck("create", ["authentication", {
          "strategy": "local",
          "email": "a@a.com",
          "password": "123@mudar"
        }]);
        print(user[0]);
      });
      socket.connect();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data"),actions: <Widget>[
        MaterialButton(
          child: Text("btn"),
          onPressed: () async {
            if (await socket.isConnected()){
              var response = await socket.emitWithAck("find", ["messages"]);
              List messageList = response[0];
              messages = [];
              messageList.forEach((message){
                messages.add(message["text"]);
              });
              setState(() {
                
              });
            }
          },
        )
      ],),
      body: ListView.builder(
        itemCount: messagesController.messages.length,
        itemBuilder: (ctx, index){
          return ListTile(
            title: Text(messagesController.messages[index].title),
          );
        },
      ),
    );
  }
}