import 'package:adhara_test/services/messages_service.dart';
import 'package:adhara_test/widgets/default_button.dart';
import 'package:adhara_test/widgets/default_textfield.dart';
import 'package:flutter/material.dart';

class MessageForm extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text("Nova mensagem"),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DefaultTextField(controller: messageController),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                DefaultButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, 
                  title: "Cancelar"
                ),
                Spacer(),
                DefaultButton(
                  title: "Inserir",
                  onPressed: () async {
                    await MessagesService.createMessage(messageController.text.toString());
                    Navigator.of(context).pop();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget messageForm(BuildContext context) {
  return AlertDialog(
      title: Text("Nova tarefa"),
      content: Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                children: <Widget>[
                  MaterialButton(
                  child: Text("Cancelar"),
                  onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    child: Text("Inserir"),
                    onPressed: () async {
                      MessagesService.createMessage("teste");
                    },
                  )
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}