import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:adhara_socket_io/manager.dart';
import 'package:adhara_socket_io/socket.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> users = ["Alfredoaldo"];
  SocketIOManager manager = SocketIOManager();
  SocketIO socket;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data"),actions: <Widget>[
        MaterialButton(
          child: Text("btn"),
          onPressed: () async {
            socket = await manager.createInstance(SocketOptions(
              "http://10.0.2.2:3030/",
              transports: [Transports.WEB_SOCKET]
            ));
            socket.onConnect((data){
              print("conectou");
            });
            socket.onConnectError((listener){
              print("Connect error");
              print(listener);
            });
            socket.onConnecting((listener){
              print("Connecting");
              print(listener);
            });
            socket.onConnectTimeout((listener){
              print("Connect timeout");
              print(listener);
            });
            socket.connect();
            print("apertou o btn");
          },
        )
      ],),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (ctx, index){
          return ListTile(
            title: Text(users[index]),
          );
        },
      ),
    );
  }
}