import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:adhara_test/models/message.dart';
import 'package:adhara_test/screens/login.dart';
import 'package:adhara_test/services/socket.dart';
import 'package:adhara_test/store/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
  home: MultiProvider(
    child: Login(),
    providers: [
      Provider<Messages>(
        create: (_) => Messages(),
        dispose: (_, controller)=>controller.dispose(),
      )
    ],
  ),
));

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final messagesController = Provider.of<Messages>(context);
    return FutureBuilder(
      future: Connector.manager.createInstance(SocketOptions(
        "http://10.0.2.2:3030/",
        transports: [Transports.WEB_SOCKET]
      )),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Connector.socket = snapshot.data;
          Connector.socket.onConnect((data) async {
            print("on connect");
            Connector.user = await Connector.socket.emitWithAck("create", ["authentication", {
              "strategy": "local",
              "email": "a@a.com",
              "password": "123@mudar"
            }]);
            print(Connector.user);
            Connector.socket.emitWithAck("find", ["messages"]).then((response){
              List messageList = response[0];
              print(response);
              messageList.forEach((message){
                messagesController.addMessage(Message(message["text"], message["_id"]));
              });
            });
          });
          Connector.socket.connect();
          Connector.socket.on("messages created", (message){
            messagesController.addMessage(Message(message["text"], message["_id"]));
          });
          return Home();
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
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