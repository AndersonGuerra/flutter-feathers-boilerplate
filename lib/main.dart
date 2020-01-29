import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:adhara_socket_io/manager.dart';
import 'package:adhara_socket_io/socket.dart';
import 'package:adhara_test/services/socket.dart';
import 'package:adhara_test/store/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
  home: MultiProvider(
    child: Home(),
    providers: [
      Provider<Messages>(
        create: (_) => Messages(),
        dispose: (_, controller)=>controller.dispose(),
      )
    ],
  ),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> messages = [];
  SocketIOManager manager = SocketIOManager();
  SocketIO socket;

  @override
  void initState() {
    super.initState();
    Connector();
  }

  @override
  Widget build(BuildContext context) {
    final messagesController = Provider.of<Messages>(context);
    return Scaffold(
      appBar: AppBar(title: Text("data"),actions: <Widget>[
        MaterialButton(
          child: Text("btn"),
          onPressed: () {},
        )
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Connector.createMessage("teste");
        },
      ),
      body: Observer(builder: (_) {
         return ListView.builder(
          itemCount: messagesController.messages.length,
          itemBuilder: (ctx, index){
            return Observer(builder: (_) {
              return ListTile(
                title: Text(messagesController.messages[index].title),
                subtitle: Text(messagesController.messages[index].id));
                },
              );
            },
          );
        },
      ),
    );
  }
}