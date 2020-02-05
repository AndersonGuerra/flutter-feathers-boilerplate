import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:adhara_test/screens/login.dart';
import 'package:adhara_test/services/messages_service.dart';
import 'package:adhara_test/utils/socket.dart';
import 'package:adhara_test/store/messages.dart';
import 'package:adhara_test/widgets/message_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
  home: MultiProvider(
    child: InitialScreen(),
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
    if (Connector.socket != null) {
      print("deveria chegar aqui primeiro");
      Connector.manager.clearInstance(Connector.socket).then((_){
        print("limpou para conectar do 0");
        return initialScreen(messagesController);
      });
    }
    print("primeira conexão");
    return initialScreen(messagesController);
}

Widget initialScreen(Messages messagesController){
  return FutureBuilder(
      future: Connector.manager.createInstance(SocketOptions(
        "http://10.0.2.2:3030/",
        transports: [Transports.WEB_SOCKET]
      )),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Connector.stablishInitialConnection(snapshot.data, messagesController);
          return ValueListenableBuilder(
            valueListenable: Connector.user, 
            builder: (BuildContext context, Map value, Widget child) {
              if (value["accessToken"] != null) {
                MessagesService.setConfigs(messagesController);
                return Home();
              } else {
                return Login();
              }
            },
          );
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
          showDialog(
            context:  context,
            builder:  (BuildContext context) {
              return MessageForm();
            },
          );
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